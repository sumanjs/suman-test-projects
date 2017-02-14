#!/usr/bin/env bash



DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"

##############################################################################################

OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log

rm -rf node_modules
SUMAN_POSTINSTALL_IS_DAEMON=yes npm --loglevel=error --only=production --progress=false install -D sumanjs/suman#dev_integration &>/dev/null &&
#SUMAN_POSTINSTALL_IS_DAEMON=yes npm --loglevel=error --progress=false install -D sumanjs/suman#dev_integration > ${OUTPUT_PATH} 2>&1 &&

# 1
./node_modules/.bin/suman --init -f &&
./node_modules/.bin/suman &&

# 2
./node_modules/.bin/suman --init -f &&
./node_modules/.bin/suman --suman-helpers-dir=$(ls -dr suman-* | head -1) &&

# 3
./node_modules/.bin/suman --init -f &&
./node_modules/.bin/suman --suman-helpers-dir=$(ls -dr suman-* | head -1) &&

# 4
./node_modules/.bin/suman --init -f &&
./node_modules/.bin/suman --suman-helpers-dir=$(ls -dr suman-* | head -1)

# old stuff below:

# we want to force suman to use the temporary helpers dir instead
#npm test -- --suman-helpers-dir=$(find . -maxdepth 1 -type d -name 'suman-*'| head -n1)
#npm test -- --suman-helpers-dir=$(find . -mindepth 1 -maxdepth 1 -name 'suman-*' -type d | sort -zn | tail -zn1)
# we want to force suman to use the temporary helpers dir instead
#npm test -- --suman-helpers-dir=$(find . -maxdepth 1 -type d -name 'suman-*'| head -n1)

#################################################################################################

EXIT=$?
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}