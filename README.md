# Jenkins

![jenkins fire](https://jenkins.io/images/logos/fire/256.png)
![jenkins mario](https://jenkins.io/images/logos/plumber/256.png)

Jenkins with connection to the docker host to run tests and send the build to registry

### Usage

- git clone

- change the default password in the Dockerfile

- docker-compose up -d

- you can access the jenkins in the port 8080 (or change the mapping)

- the registry's purpose is to build the images that passes the pipeline's tests

### Sonar

0. Add SonarScanner on Jenkins with custom sonar-scanner.properties:

1. Add the following to the dockerfile

~~~~
RUN cd /opt && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip && unzip sonar-scanner-cli-4.0.0.1744-linux.zip && rm -rf sonar-scanner-cli-4.0.0.1744-linux.zip

COPY ./sonar-scanner.properties opt/sonar-scanner-4.0.0.1744-linux/conf/sonar-scanner.properties
~~~~~

the custom sonnar scanner file must contain the containers host name or server IP (vm):

~~~~
sonar.host.url=http://sonarqube:9000

sonar.sourceEncoding=UTF-8
~~~~

2. Add SonarQube plugin to jenkins (already added added to the plugins.txt) [Tutorial](https://www.youtube.com/watch?v=k-3krTRuAFA)


## Sources

[continuous-delivery-of-react-app-with-jenkins-and-docker](https://medium.com/hackernoon/continuous-delivery-of-react-app-with-jenkins-and-docker-8a1ae1511b86)
