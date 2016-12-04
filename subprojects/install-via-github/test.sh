#!/usr/bin/env bash

npm --loglevel=error install &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"