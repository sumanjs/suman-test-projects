#!/usr/bin/env bash

# this script will cd into each directory and run the bash script called test.sh in each directory
# if this script exits cleanly, then all tests pass

echo "jesus is watching" &&

rm -rf node_modules


PROJECT_ROOT=$(cd $(dirname $(dirname ${0})) && pwd);
OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.logs

DIR="${PROJECT_ROOT}/subprojects";

echo " => subprojects DIR => $DIR"

for d in "$DIR"/* ; do
     echo "removing node_modules from this directory => $d"
    ZOOM=$(cd "$d" && rm -rf node_modules)
done

echo "now installing npm deps in this dir => $PWD"

echo "items in this dir (PWD) => $(ls -a)"

if [ -e "$(cd ~/.suman && pwd)" ]; then
   echo "items in .suman dir => $(cd ~/.suman && ls -a)"
 else
   echo " ! No ~/.suman dir present yet... "
fi


# installs via github, not npm
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1  &&


if [ -e "$(cd ~/.suman && pwd)" ]; then
  echo "items in .suman/node_modules/.bin dir => $(cd  ~/.suman/node_modules/.bin/ && ls -a)"
 else
   echo " ~/.suman dir was not created, test fail "
   exit 1;
fi



echo "now running suman tests"
./node_modules/.bin/suman test/test-all.js