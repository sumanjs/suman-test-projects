#!/usr/bin/env bash


DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"

###################################################################################


OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log
rm -rf node_modules
SUMAN_POSTINSTALL_IS_DAEMON=yes npm install --loglevel=warn --only=production --progress=false  &>/dev/null &&
#SUMAN_POSTINSTALL_IS_DAEMON=yes npm install --loglevel=warn --only=production --progress=false > ${OUTPUT_PATH} 2>&1 &&
npm test

#######################################################################################

EXIT=$?
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}