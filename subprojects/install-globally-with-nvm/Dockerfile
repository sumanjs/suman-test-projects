
#http://stackoverflow.com/questions/27701930/add-user-to-docker-container

# start with this image as a base
FROM node:5

RUN npm cache clean

RUN apt-get update && \
      apt-get -y install sudo

RUN sudo touch ~/.bash_profile

RUN sudo chmod -R 777 $(npm root -g)

RUN sudo echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN sudo chmod -R 777 .

ENTRYPOINT ["/usr/src/app/local.sh"]

