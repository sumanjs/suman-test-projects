#!/usr/bin/env bash


if [ "yes" == "${USE_DOCKER}" ]; then


  docker build  -t init-from-nothing $(dirname "$0")
  docker run -it --tty=false --rm init-from-nothing

else

  sh $(dirname "$0")/local.sh

fi




