# VRFloorTrackingResearch

The client uses Unity

the floorserver can be build in the following way:

debian/ubuntu:
sudo apt-get install libcppnetlib-dev libboost-all-dev libssl-dev libsdl2-dev

cd into source dir
mkdir build && cd build
cmake ..

optional: use toolchain file for cross-compiler
example: (using mxe to cross-compile for windows)
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/mxe/usr/i686-w64-mingw32.shared/share/cmake/mxe-conf.cmake ..

then build it with [make]
then run it with [./floorServer]
