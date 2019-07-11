FROM jenkins/jenkins:2.176.1-alpine

USER root

ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false -Xms128m -Xmx128m'

RUN apk update && \
    apk add \
    docker \
    shadow

RUN touch /var/run/docker.sock
RUN chmod 777 /var/run/docker.sock

USER jenkins
