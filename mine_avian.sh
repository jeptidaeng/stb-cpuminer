#!/bin/bash

mine_avn() {
# Mining Algorithm
ALGO=minotaurx

# Pool URL #
POOL=stratum+tcp://minotaurx.sea.mine.zpool.ca:7019

# Wallet address to mine (AVN coin recomended)#
WALLET=Fill_Your_AVN_Address_Here

# Pool Password (Optional) #
PASS="c=AVN"

# Mining thread to use #
# To know how many your own cpu threads, #
# Type lscpu on the terminal #
THR=8

# Miner config[Do not edit if you not understand] #

clear
./cpuminer -a $ALGO -o $POOL -u $WALLET -p $PASS -t $THR
}
mine_avn
