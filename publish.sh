#!/usr/bin/env bash
set -u

readonly VERSION="1.0"
if [[ "$(uname)" == 'Darwin' ]]; then
  readonly SCRIPT_DIR_PATH=$(dirname $(greadlink -f $0))
else
  readonly SCRIPT_DIR_PATH=$(dirname $(readlink -f $0))
fi

cd $SCRIPT_DIR_PATH
if [[ "$(uname)" == 'Darwin' ]]; then
  ./build-macos.sh && ./build-ubuntu.sh
else
  ./build-ubuntu.sh
fi

nuget pack -OutputDirectory package_output
dotnet nuget push package_output/Secp256k1.Native.0.0.0.nupkg -k $NUGET_API_KEY_SECP256K1 -s https://www.myget.org/F/joemphilips/api/v2/package
