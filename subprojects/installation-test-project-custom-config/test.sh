#!/usr/bin/env bash

OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.log

npm --loglevel=warn --progress=false install ${OUTPUT_PATH} 2>&1 &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"