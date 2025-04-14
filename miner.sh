#!/bin/bash

mine_xna() {
# Mining Algorithm
ALGO=minotaurx

# Pool URL #
POOL=stratum+tcp://minotaurx.sea.mine.zpool.ca:7019

# Wallet address to mine (XNA coin recomended)#
WALLET=RnVU6HeXBDhA3DFFBaNrcqZynusVFkToo

# Pool Password (Optional) #
PASS="c=XNA"

# Mining thread to use #
# To know how many your own cpu threads, #
# Type lscpu on the terminal #
THR=4

# Miner config[Do not edit if you not understand] #

clear
./cpuminer -a $ALGO -o $POOL -u $WALLET -p $PASS -t $THR
}
mine_xna
