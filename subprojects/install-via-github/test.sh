#!/usr/bin/env bash

rm -rf node_modules
npm --loglevel=error install --progress=false &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"