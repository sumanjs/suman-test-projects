#!/usr/bin/env bash


OUTPUT_PATH=${PROJECT_ROOT:-$PWD}/npm-install-output.log


cd $(dirname "$0")/one && echo $PWD && rm -rf node_modules && npm --loglevel=warn --progress=false install &
cd $(dirname "$0")/two && echo $PWD && rm -rf node_modules && npm --loglevel=warn --progress=false install &
sleep 2
cd $(dirname "$0")/three && echo $PWD && rm -rf node_modules && npm --loglevel=warn --progress=false install &
wait

#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#sleep 3
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#sleep 2
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#sleep 1
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
#wait