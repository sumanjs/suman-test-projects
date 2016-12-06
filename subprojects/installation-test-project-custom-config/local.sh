#!/usr/bin/env bash


OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log

rm -rf $(dirname "$0")/node_modules

#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &&
echo "about to run npm install"
npm --loglevel=warn --progress=false install  &&
echo "done with npm install"
#npm test
./node_modules/.bin/suman test/one.test.js --config=conf.js

#echo "bash exit code => $?" &&
#exit "$?"