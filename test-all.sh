#!/usr/bin/env bash

# this script will cd into each directory and run the bash script called test.sh in each directory
# if this script exits cleanly, then all tests pass

echo "jesus is watching" &&
npm install -D oresoftware/suman &&  # installs via github, not npm
./node_modules/.bin/suman test-all.js --cwd-is-root