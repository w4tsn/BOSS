# Odysseus BOSS fork

This is a fork of the BOSS-Project from David Churchills UAlbertaBot. It is compiled on Windows with Visual Studio 2013 and can be used as a standalone version to be included in other bots.

This version of BOSS features an experimental cross-compile setup, which is still work in progress. Together with the CMake/G++ support of BWAPI in the future (see [BWAPI/Issue #626](https://github.com/bwapi/bwapi/issues/626)), this should enable the development of StarCraft bots on linux operating systems.

The cross-compilation is based on the dockcross/windows-x86 docker-image. Therefore the cross-compilation process could be executed on any system supporting docker.