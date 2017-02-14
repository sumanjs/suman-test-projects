#!/usr/bin/env bash


if [ "yes" == "${USE_DOCKER}" ]; then

  NAME=$(basename $(cd $(dirname "$0") && pwd)) # e.g. parallel-installs-of-suman
  echo "Using docker for $NAME test"
  docker build  -t  ${NAME} $(dirname "$0")
  docker run -it --tty=false --rm  ${NAME}

else
  $(dirname "$0")/local.sh
fi


EXIT=$?
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}



