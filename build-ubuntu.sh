#!/usr/bin/env bash
set -u

readonly VERSION="1.0"
if [[ "$(uname)" == 'Darwin' ]]; then
  readonly SCRIPT_DIR_PATH=$(dirname $(greadlink -f $0))
else
  readonly SCRIPT_DIR_PATH=$(dirname $(readlink -f $0))
fi

cd $SCRIPT_DIR_PATH

docker build -f ./Dockerfile.ubuntu . -t secp256k1-builder &&
  docker run -it  -v $(pwd)/build/ubuntu:/usr/output secp256k1-builder
