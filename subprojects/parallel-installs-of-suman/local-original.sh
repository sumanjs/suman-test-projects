#!/usr/bin/env bash


DIRN=$(dirname "$0")
echo " => SUMAN TEST PROJECTS => RUNNING '$DIRN'..."
echo " => PWD => $PWD"

(cd $(dirname "$0")/one && echo $PWD && rm -rf node_modules ; npm --loglevel=warn --progress=false install) &
(cd $(dirname "$0")/two && echo $PWD && rm -rf node_modules ; npm --loglevel=warn --progress=false install) &
(cd $(dirname "$0")/three && echo $PWD && rm -rf node_modules ; npm --loglevel=warn --progress=false install) &

wait; echo "EXIT CODE => $?"

EXIT=$?

echo " all done with parallel installs "
echo " => bash exit code for script '$(dirname "$0")/$(basename "$0")' => $EXIT" &&
exit ${EXIT}

