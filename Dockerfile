# Starting off with the Jenkins base Image
FROM jenkins/jenkins:latest
USER root

# Installing the plugins we need using the in-built install-plugins.sh script
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
 
# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Start-up scripts to set number of executors and creating the admin user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Copy and runs the script that allow using docker within the container
COPY docker-debian.sh docker-debian.sh
RUN chmod 777 docker-debian.sh && ./docker-debian.sh
