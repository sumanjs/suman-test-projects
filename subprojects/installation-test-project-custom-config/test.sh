#!/usr/bin/env bash


if [ "yes" -eq "${USE_DOCKER}" ]; then


  NAME=$(basename $(cd $(dirname "$0") && pwd)) # e.g. installation-test-project-custom-config

   echo "Using docker for $NAME test"

  docker build  -t  ${NAME} $(dirname "$0")
  docker run -it --tty=false --rm ${NAME}

else

  sh $(dirname "$0")/local.sh

fi




