#!/bin/bash

set -e
echo "Updating and installing required things"
apt install wget nano -y
echo "Cloning and starting wget compiling"
git clone https://github.com/jeptidaeng/stb-cpuminer.git
cd ~/stb-cpuminer
apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ libtool -y
# build-linux-arm
echo "Basic *nix build instructions"
if ! ./build-linux-arm.sh ..; then
    echo "Error: CMake configuration failed"
    exit 1
else
     ..
fi
# compile
echo "Compiling now"
if ! build-linux-arm; then
    echo "Error: Compiling failed"
    exit 1
else
    make && echo "Done... you can use run script now"
fi
