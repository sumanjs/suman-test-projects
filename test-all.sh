#!/usr/bin/env bash

# this script will cd into each directory and run the bash script called test.sh in each directory
# if this script exits cleanly, then all tests pass

npm install -g suman &&
suman test-all.js --cwd-is-root