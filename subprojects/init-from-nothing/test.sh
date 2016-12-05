#!/usr/bin/env bash

#rm -rf node_modules

OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.log

rm -rf test
echo ".....Installing suman with 'npm install -D --silent --progress=false github:oresoftware/suman#dev'...." &&
npm install -D --silent --progress=false github:oresoftware/suman#dev -f > ${OUTPUT_PATH} 2>&1 &&
echo "...Making test directory..." &&
mkdir test
echo "....initing suman..." &&
SUMAN_DEBUG=s ./node_modules/.bin/suman --init -f &&
echo "....DONE initing suman..." &&
echo $(ls -a) &&
echo "....creating new test file..." &&
SUMAN_DEBUG=s ./node_modules/.bin/suman --create test/one.test.js &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"