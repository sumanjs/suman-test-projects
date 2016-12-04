#!/usr/bin/env bash

# this script will cd into each directory and run the bash script called test.sh in each directory
# if this script exits cleanly, then all tests pass

echo "jesus is watching" &&

rm -rf node_modules

DIR="$(cd $(dirname $(dirname ${0})) && pwd)/subprojects";

for d in "$DIR"/* ; do
     echo "removing node_modules from this directory => $d"
    ZOOM=$(cd "$d" && rm -rf node_modules)
done

echo "now installing npm deps in this dir => $PWD"

# installs via github, not npm
npm --loglevel=warn --progress=false install  &&

echo "now running suman tests"
./node_modules/.bin/suman test/test-all.js