ARG JENKINS_VERSION=2.488

FROM spryker/jenkins-boilerplate:${JENKINS_VERSION} AS jenkins_boilerplate

FROM jenkins/jenkins:${JENKINS_VERSION} AS jenkins

COPY --from=jenkins_boilerplate /usr/share/jenkins/ref/plugins /usr/share/jenkins/ref/plugins
COPY --from=jenkins_boilerplate /usr/share/jenkins/jenkins.war /usr/share/jenkins/jenkins.war
COPY --from=jenkins_boilerplate /usr/share/jenkins/jenkins-cli.jar /usr/share/jenkins/jenkins-cli.jar

USER root

ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false -Xms128m -Xmx128m'

RUN apt update && \
    apt install -y \
    docker \
    netcat-openbsd

USER jenkins
