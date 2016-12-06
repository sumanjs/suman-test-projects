#!/usr/bin/env bash


OUTPUT_PATH=${PROJECT_ROOT}/npm-install-output.log


npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
sleep 3
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
sleep 2
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
sleep 1
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
npm --loglevel=warn --progress=false install > ${OUTPUT_PATH} 2>&1 &
wait

