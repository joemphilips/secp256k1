#!/usr/bin/env bash
set -u

readonly VERSION="1.0"
if [[ "$(uname)" == 'Darwin' ]]; then
  readonly SCRIPT_DIR_PATH=$(dirname $(greadlink -f $0))
else
  readonly SCRIPT_DIR_PATH=$(dirname $(readlink -f $0))
fi

cd $SCRIPT_DIR_PATH


./autogen.sh && ./configure --enable-module-ecdh --enable-module-recovery --enable-experimental && make -j6
cp ./.libs/libsecp256k1.dylib ./build/macos
