#!/usr/bin/env bash

OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log

rm -rf node_modules
SUMAN_POSTINSTALL_IS_DAEMON=yes npm --loglevel=error install --progress=false > ${OUTPUT_PATH} 2>&1 &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"