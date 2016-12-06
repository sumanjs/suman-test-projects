#!/usr/bin/env bash


if [ "yes" == "${USE_DOCKER}" ]; then

#  NAME=$(basename $(readlink $(dirname "$0")))   # e.g. installation-test-project-custom-config

   NAME=$(basename $(cd $(dirname "$0") && pwd))
  echo "NAME $NAME"

  docker build  -t  ${NAME} $(dirname "$0")
  docker run -it --tty=false --rm ${NAME}

else

  sh $(dirname "$0")/local.sh

fi




