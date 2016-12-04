#!/usr/bin/env bash

npm --loglevel=warn install &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"