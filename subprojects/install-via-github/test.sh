#!/usr/bin/env bash

OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.log

rm -rf node_modules
npm --loglevel=error install --progress=false ${OUTPUT_PATH} 2>&1 &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"