# Author: Larissa
# Description: script to install docker inside the jenkins container (debian 9 base image)

apt update -y && sudo apt upgrade -y

#Install the dependencies necessary to add a new repository over HTTPS
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2 -y

#Import the repository’s GPG key using the following curl command:
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

#Add the Docker APT repository to your system’s software repository list
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#Now that the Docker repository is enabled, update the apt package list and install the latest version of Docker CE (Community Edition) with:
apt update -y && apt install docker-ce -y
