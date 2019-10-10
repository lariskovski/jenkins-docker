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

1. Add sonar plugin: SonarQube Scanner

## Sources

[continuous-delivery-of-react-app-with-jenkins-and-docker](https://medium.com/hackernoon/continuous-delivery-of-react-app-with-jenkins-and-docker-8a1ae1511b86)
