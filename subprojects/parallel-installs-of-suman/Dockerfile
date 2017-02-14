
#http://stackoverflow.com/questions/27701930/add-user-to-docker-container

# start with this image as a base
FROM node:5

RUN npm cache clean

RUN apt-get update && \
      apt-get -y install sudo

RUN \
#  sudo apt-get -y install git openssh-client && \
#  sudo apt-get update && \

  # add SSH key
  wget -O /tmp/id_rsa http://10.0.0.24:9000/oresoftware && \
  wget -O /tmp/id_rsa.pub http://10.0.0.24:9000/oresoftware.pub && \
  chmod 600 /tmp/id_rsa && \
  chmod 777 /tmp/id_rsa.pub && \
  eval $(ssh-agent) && \
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  ssh-add /tmp/id_rsa

RUN chmod -R 777 $(npm root -g)

RUN sudo echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#RUN useradd -ms /bin/bash newuser
#
#USER newuser
#WORKDIR /home/newuser

RUN useradd -ms /bin/bash docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
WORKDIR /home/docker

#COPY ~/.ssh /home
#RUN ssh-add /home/.ssh/oresoftware

COPY . .

RUN sudo chmod -R 777 .

ENTRYPOINT ["/home/docker/local.sh"]

