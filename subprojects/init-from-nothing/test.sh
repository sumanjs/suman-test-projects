#!/usr/bin/env bash

#rm -rf node_modules

OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log

#chown $(whoami) -R test
rm -rf test
echo ".....Installing suman with 'npm install -D --only=production --silent --progress=false github:sumanjs/suman#dev_integration'...." &&
#SUMAN_POSTINSTALL_IS_DAEMON=yes npm install -D --silent --progress=false github:sumanjs/suman#dev_integration -f > ${OUTPUT_PATH} 2>&1 &&
SUMAN_POSTINSTALL_IS_DAEMON=yes npm install -D --only=production --loglevel=warn --progress=false github:sumanjs/suman#dev_integration -f &>/dev/null &&
echo "...Making test directory..." &&
mkdir test
echo "....initing suman..." &&
./node_modules/.bin/suman --init -f &&
echo "....DONE initing suman..." &&
echo $(ls -a) &&
echo "....creating new test file..." &&
./node_modules/.bin/suman --create test/one.test.js &&
./node_modules/.bin/suman test/one.test.js

EXIT=$?
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}