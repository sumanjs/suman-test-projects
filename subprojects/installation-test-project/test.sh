#!/usr/bin/env bash

npm link suman &&
./node_modules/.bin/suman --init -f &&
npm install &&
npm test &&
./node_modules/.bin/suman --init -f &&
npm test