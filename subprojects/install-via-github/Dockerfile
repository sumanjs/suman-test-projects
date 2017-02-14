
#http://stackoverflow.com/questions/27701930/add-user-to-docker-container

# start with this image as a base
FROM node:5

RUN cat /proc/version

RUN apt-get update && \
      apt-get -y install sudo

RUN npm cache clean

RUN chmod -R 777 $(npm root -g)

RUN sudo echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#RUN useradd -ms /bin/bash newuser
#
#USER newuser
#WORKDIR /home/newuser

RUN useradd -ms /bin/bash docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
WORKDIR /home/docker


COPY . .

RUN sudo chmod -R 777 .

ENTRYPOINT ["/home/docker/test.sh"]

