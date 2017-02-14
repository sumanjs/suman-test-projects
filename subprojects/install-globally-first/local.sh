#!/usr/bin/env bash


DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"
OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log
rm -rf $(dirname "$0")/node_modules
echo "about to run npm install --globally"
npm install -g github:sumanjs/suman#dev_integration --only=production --unsafe-perm --loglevel=warn --progress=false &>/dev/null &&
echo "done with npm install" &&
echo "running suman --init" &&
echo "PWD => $PWD" &&
suman --init  -f &&
./node_modules/.bin/suman test/one.test.js
