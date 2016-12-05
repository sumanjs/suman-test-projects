#!/usr/bin/env bash



OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.log

npm --loglevel=warn --progress=false install ${OUTPUT_PATH} 2>&1 &&
NODE_PATH=${NODE_PATH}:~/.suman/node_modules && node test.js
#node test.js