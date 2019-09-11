# Jenkins

![jenkins fire](https://jenkins.io/images/logos/fire/256.png)
![jenkins mario](https://jenkins.io/images/logos/plumber/256.png)

jenkins with connection to the docker host to run tests and send the build to registry

- Using this guide:

https://medium.com/hackernoon/continuous-delivery-of-react-app-with-jenkins-and-docker-8a1ae1511b86

- Use this repo as example:

https://github.com/lariskovski/react-app


### usage

- git clone

- change the default password in the Dockerfile

- docker-compose up -d

- you can access the jenkins in the port 8080 (or change the mapping)

- the registry's purpose is to build the images that passes the pipeline's tests (as the jenkins has access to the docker host's docker comamnds)
