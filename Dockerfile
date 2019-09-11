FROM jenkins/jenkins:lts
USER root

COPY ./docker-debian.sh /docker-debian.sh

RUN chmod +x /docker-debian.sh && ./docker-debian.sh
