FROM jenkins-boilerplate--local:2.401.2-200

USER root

ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false -Xms128m -Xmx128m'

RUN apt update && \
    apt install -y \
    docker \
    netcat

USER jenkins
