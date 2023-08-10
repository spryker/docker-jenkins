FROM jenkins/jenkins:2.176.1-jdk11

USER root

ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false -Xms128m -Xmx128m'

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list

RUN apt update && \
    apt install -y \
    docker \
    netcat

USER jenkins
