
#http://stackoverflow.com/questions/27701930/add-user-to-docker-container

# start with this image as a base
FROM node:5

RUN npm cache clean

ARG s
ARG sname

RUN echo "s => " && echo $s
RUN echo "sname => " && echo $sname

#ENV sname $sname

RUN chmod -R 777 $(npm root -g)

RUN useradd -ms /bin/bash newuser

USER newuser
WORKDIR /home/newuser

COPY $s .

RUN echo " linking sname given by => "  && echo $sname && ln -s /home/newuser/$sname /home/newuser/docker_entrypoint.sh
ENTRYPOINT ["/home/newuser/docker_entrypoint.sh"]

