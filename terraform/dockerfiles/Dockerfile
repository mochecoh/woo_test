FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN apt-get -y install apt-transport-https
RUN apt-get -y install ca-certificates
RUN apt-get -y install curl
RUN apt-get -y install gnupg2
RUN apt-get -y install software-properties-common
RUN curl -fsSL https://get.docker.com -o ~/get-docker.sh
RUN chmod 777 ~/get-docker.sh
RUN ~/get-docker.sh \
     apt-get update && \
     apt-get -y install docker-ce
WORKDIR /usr/src
RUN apt-get update
RUN usermod -aG docker jenkins
RUN groupmod -g 999 docker
USER jenkins
