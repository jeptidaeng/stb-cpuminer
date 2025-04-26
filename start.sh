#!/bin/bash

mine_avn() {
# Mining Algorithm
ALGO=minotaurx

# Pool URL #
POOL=stratum+tcp://au.mining4people.com:3638

# Wallet address to mine (AVN coin recomended)#
WALLET=RWg8MowuVoXmk8wwm7TjPrZnMyKKKuCTkZ.STB

# Pool Password (Optional) #
PASS="x"

# Mining thread to use #
# To know how many your own cpu threads, #
# Type lscpu on the terminal #
THR=4

# Miner config[Do not edit if you not understand] #

clear
./cpuminer -a $ALGO -o $POOL -u $WALLET -p $PASS -t $THR
}
mine_avn
