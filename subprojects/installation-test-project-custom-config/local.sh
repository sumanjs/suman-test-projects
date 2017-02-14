#!/usr/bin/env bash


DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"

##############################################################################################

OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log
rm -rf $(dirname "$0")/node_modules
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &&
echo "about to run npm install"
npm --loglevel=warn --progress=false --only=production install  &>/dev/null &&
echo "done with npm install"
./node_modules/.bin/suman test/one.test.js --config=conf.js


EXIT=$? &&
echo " " && # newline
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}