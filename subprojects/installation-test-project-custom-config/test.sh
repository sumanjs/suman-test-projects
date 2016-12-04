#!/usr/bin/env bash

npm --loglevel=warn --progress=false install &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"