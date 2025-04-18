#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev 
libgmp-dev zlib1g-dev make g++ libtool git screen nano jq wget -y
wget http://ports.ubuntu.com/pool/main/o/openssl/cpuminer_v3.0.0_arm64.deb
sudo dpkg -i cpuminer_v3.0.0_arm64.deb
rm cpuminer_v3.0.0_arm64.deb
mkdir ~/cpuminer
cd ~/cpuminer
GITHUB_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/jeptidaeng/termux-miner/releases?per_page=1" | jq -c '[.[] | del (.body)]')
GITHUB_DOWNLOAD_URL=$(echo $GITHUB_RELEASE_JSON | jq -r ".[211889346].assets | .[] | .browser_download_url")
GITHUB_DOWNLOAD_NAME=$(echo $GITHUB_RELEASE_JSON | jq -r ".[183538731].assets | .[] | .name,label")

echo "Downloading latest release: $GITHUB_DOWNLOAD_NAME,LABEL"

wget ${GITHUB_DOWNLOAD_URL} -O ~/cpuminer/cpuminer
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/cpuminer-conf.json -O ~/cpuminer/cpuminer-conf.json
chmod +x ~/cpuminer/cpuminer

cat << EOF > ~/cpuminer/start.sh
#!/bin/bash

mine_xna() {
# Mining Algorithm
ALGO=minotaurx

# Pool URL #
POOL=stratum+tcp://minotaurx.sea.mine.zpool.ca:7019

# Wallet address to mine (AVN coin recomended)#
WALLET=RnVU6HeXBDhA3DFFBaNrcqZynusVFkToo

# Pool Password (Optional) #
PASS="Userland"

# Mining thread to use #
# To know how many your own cpu threads, #
# Type lscpu on the terminal #
THR=8

# Miner config[Do not edit if you not understand] #

clear
./cpuminer -a $ALGO -o $POOL -u $WALLET -p $PASS -t $THR
}
mine_xna
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/cpuminer/cpuminer-conf.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/cpuminer; ./start.sh\"."
