#!/usr/bin/env bash


DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"

##############################################################################################

OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log

echo " => running npm install ..."
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &&
SUMAN_POSTINSTALL_IS_DAEMON=no npm --loglevel=warn --progress=false --only=production install &&
NODE_PATH=${NODE_PATH}:~/.suman/global/node_modules node $(dirname "$0")/test.js

EXIT=$? &&
echo " " && # newline
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}