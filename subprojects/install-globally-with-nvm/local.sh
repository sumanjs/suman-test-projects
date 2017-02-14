#!/usr/bin/env bash

echo "USE_DOCKER => ${USE_DOCKER}";

DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"
OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log &&
rm -rf $(dirname "$0")/node_modules &&
echo "about to run npm install --globally" &&

NVM_INSTALL=$(which nvm);
echo "path to nvm => '${NVM_INSTALL}'" &&

if [[ -z ${NVM_INSTALL} ]]; then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash &&
    export NVM_DIR="/root/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  && # This loads nvm
    echo "about to install node version 6 with NVM" &&
    nvm install 6 &&
    nvm use 6
fi

# use the following echo call to avoid having to type in password at prompt
npm install -g github:sumanjs/suman#dev_integration --only=production --unsafe-perm --loglevel=warn --progress=false &>/dev/null &&
echo "done with npm install" &&
echo "running suman --init" &&
suman --init  &&
./node_modules/.bin/suman test/one.test.js