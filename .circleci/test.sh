#!/bin/bash

set -ex

source "/tmp/venv/bin/activate"

DIR=$(dirname $0)

CONFIG_DIR=/tmp/config
LOCAL_REPORTER_DIR=/tmp/reporter

mkdir -p "$CONFIG_DIR"
mkdir -p "$LOCAL_REPORTER_DIR"
echo "{}" > "$CONFIG_DIR/config.txt"

case ${CIRCLE_JOB} in
  PYTORCH)
    sh ${DIR}/tests/test_pytorch.sh
    ;;
  TFLITE)
    sh ${DIR}/tests/test_tflite.sh
    ;;
  *)
    echo "Error, '${CIRCLE_JOB}' not valid mode; Must be one of {PYTORCH, TFLITE}."
    exit 1
    ;;
esac
