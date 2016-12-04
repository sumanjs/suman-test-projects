#!/usr/bin/env bash

#rm -rf node_modules
npm link suman
npm --loglevel=warn --progress=false install &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"