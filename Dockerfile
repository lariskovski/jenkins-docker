FROM jenkins/jenkins:lts
USER root

COPY docker-debian.sh docker-debian.sh

RUN chmod 777 docker-debian.sh && ./docker-debian.sh
