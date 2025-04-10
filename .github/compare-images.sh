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
'
