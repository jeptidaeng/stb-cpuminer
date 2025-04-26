#!/bin/bash

set -e
echo "Updating and installing required things"
apt install wget cmake nano -y
echo "Cloning and starting wget compiling"
mkdir cpuminer && cd cpuminer
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/build-linux-arm.sh
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/cpuminer-conf.json
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/start.sh
chmod +x build-linux-arm.sh cpuminer-conf.json start.sh
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
