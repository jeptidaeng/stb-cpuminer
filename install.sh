#!/bin/bash

set -e
echo "Updating and installing required things"
apt install wget cmake nano cmake -y
echo "Cloning and starting wget compiling"
mkdir cpuminer && cd cpuminer
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/build-linux-arm.sh
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/cpuminer-conf.json
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/start.sh
chmod +x build-linux-arm.sh cpuminer-conf.json start.sh
apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ libtool -y
# Cmake
echo "Basic *nix build instructions"
if ! bash autogen.sh ..; then
    echo "Error: CMake configuration failed"
    exit 1
else
    ./build-linux-arm.sh ..
fi
# compile
echo "Compiling now"
if ! Cmake; then
    echo "Error: Compiling failed"
    exit 1
else
    make && echo "Done... you can use run script now"
fi
