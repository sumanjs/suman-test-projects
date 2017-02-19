#!/usr/bin/env bash

# this script will cd into each directory and run the bash script called test.sh in each directory
# if this script exits cleanly, then all tests pass

echo "jesus is watching" &&

DIR_NOW=$(cd $(dirname "$0") && pwd)
rm -rf DIR_NOW/node_modules

if [ ! -z ${SUMAN_PARALLEL} ]; then
echo " => We are running all suman tests in parallel..."
fi

PROJECT_ROOT=$(cd $(dirname $(dirname $0)) && pwd);
OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.logs

DIR="${PROJECT_ROOT}/subprojects";

echo " => subprojects DIR => $DIR"

for d in "$DIR"/* ; do
     echo "removing node_modules from this directory => $d"
    ZOOM=$(cd "$d" && rm -rf node_modules)
done

echo "now installing npm deps in this dir => $PWD"
echo " items in this dir (PWD) => "
echo " $(ls -a) "
echo " " # print  newline
echo " " # print  newline

# installs via github, not npm
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1  &&
echo " => Installing suman deps in suman-test-projects top level..."

WHICH_SUMAN=$(which suman)

if [[ ! -z ${WHICH_SUMAN} ]]; then
 npm --loglevel=warn --progress=false install &>/dev/null
# npm link suman
#  npm --loglevel=warn --progress=false --only=production install # don't install suman, use npm link for suman, instead
else
 npm --loglevel=warn --progress=false install &>/dev/null
fi

SUMAN_DOT_DIR=$(cd ~/.suman && pwd)

echo " => SUMAN_DOT_DIR before install => $SUMAN_DOT_DIR"
echo " => items in SUMAN_DOT_DIR before install => $(ls -a ${SUMAN_DOT_DIR})"

if [ -d "${SUMAN_DOT_DIR}" ]; then
   echo "items in .suman dir => "
   echo " $(cd ~/.suman && ls -a) "
 else
   echo " ! No ~/.suman dir present...yet... "
fi

echo " " # print  newline
echo " " # print  newline

SUMAN_DOT_DIR=$(cd ~/.suman && pwd)
echo "SUMAN_DOT_DIR after install => $SUMAN_DOT_DIR"

if [ -d "${SUMAN_DOT_DIR}" ]; then
  echo "items in .suman/global/node_modules/.bin dir => $(cd  ~/.suman/global/node_modules/.bin && ls -a)"
 else
   echo " ~/.suman dir was not created, test fail "
   exit 1;
fi


echo "now running suman tests"

if [[ "${USE_RUNNER}" == "yes" ]]; then

#You can use sed to "edit" each line by appending your required suffix:
#find subprojects -mindepth 1 -maxdepth 1 | sed 's!$!/test.sh!'

 ./node_modules/.bin/suman $(find subprojects -mindepth 2 -maxdepth 2 -name "test.sh")
else
 ./node_modules/.bin/suman test/test-all.js
fi