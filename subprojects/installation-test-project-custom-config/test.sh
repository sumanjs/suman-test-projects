#!/usr/bin/env bash

npm --loglevel=warn install &&
#npm link suman &&
npm test

#echo "bash exit code => $?" &&
#exit "$?"