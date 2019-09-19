libsecp256k1
============

See upstream README.md for general info

This is joemphilips's branch of Secp256k1.
It builds C# consumable binary and publish as nupkg

The package will be published to myget feed, so consuming project must specify m


## To update

1. Tweak file as you want.
2. change version in `Secp256k1.Native.nuspec` and `./publish.sh`
3. run `publish.sh`

> Note: right now it does not support windows.
> You might need to install `nuget` command addition to the `dotnet` command

## files and directories to note.

* `./build-macos.sh` ... script to build on macos.
* `./build-ubuntu.sh` ... script to build on ubuntu.
  * Only this one uses docker-image for building. so it can be run on any platform.
