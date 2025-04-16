#!/bin/bash

set -e

IMAGE_TAG=$1

if [ -z "$IMAGE_TAG" ]; then
  echo "Error: No image tag provided"
  exit 1
fi

docker run --rm "$IMAGE_TAG" bash -c '
  echo "=== Jenkins Version ==="
  if [ -f /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state ]; then
    cat /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
  elif command -v java &> /dev/null && [ -f /usr/share/jenkins/jenkins.war ]; then
    java -jar /usr/share/jenkins/jenkins.war --version
  else
    echo "Unknown"
  fi

  echo ""
  echo "=== OS Release ==="
  if [ -f /etc/os-release ]; then
    cat /etc/os-release
  else
    echo "Unknown"
  fi

  echo ""
  echo "=== Installed APT Packages ==="
  if command -v dpkg &> /dev/null; then
    dpkg -l | awk '\''{ print $2 " " $3 }'\'' | sort
  elif command -v apk &> /dev/null; then
    apk info -vv
  else
    echo "Package manager not found"
  fi

  echo ""
  echo "=== Java Version ==="
  java -version 2>&1 || echo "Java not installed"

  echo ""
  echo "=== Python Packages ==="
  if command -v pip &> /dev/null; then
    pip list
  elif command -v pip3 &> /dev/null; then
    pip3 list
  else
    echo "pip not installed"
  fi

  echo ""
  echo "=== Environment Variables ==="
  printenv | sort

  echo ""
  echo "=== Installed Jenkins Plugins (if any) ==="
  if [ -d /usr/share/jenkins/ref/plugins ]; then
    ls -1 /usr/share/jenkins/ref/plugins
  else
    echo "Plugin folder not found"
  fi
'
