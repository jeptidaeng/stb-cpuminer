#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev 
libgmp-dev zlib1g-dev make g++ libtool git screen nano wget -y
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/cpuminer
cd ~/cpuminer
GITHUB_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/jeptidaeng/termux-miner/releases?per_page=1" | jq -c '[.[] | del (.body)]')
GITHUB_DOWNLOAD_URL=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets | .[] | .browser_download_url")
GITHUB_DOWNLOAD_NAME=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets | .[] | .name")

echo "Downloading latest release: $GITHUB_DOWNLOAD_NAME"

wget ${GITHUB_DOWNLOAD_URL}
wget https://raw.githubusercontent.com/jeptidaeng/termux-miner/main/cpuminer
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/start.sh
chmod +x ~/cpuminer/cpuminer

cat << EOF > ~/cpuminer/cpuminer-conf.json

{
	"_comment1" : "Any long-format command line argument ",
	"_comment2" : "may be used in this JSON configuration file",

	"api-bind" : "127.0.0.1:4048",

	"url" : "stratum+tcp://minotaurx.sea.mine.zpool.ca:7019",
	"user" : "NRnVU6HeXBDhA3DFFBaNrcqZynusVFkToo",
	"pass" : "c=XNA",

	"algo" : "minotaurx",
	"threads" : 0,
	"cpu-priority" : 0,
	"cpu-affinity" : -1,

	"benchmark" : false,
	"debug" : false,
	"protocol": false,
	"show-diff": true,
	"quiet" : false
}

EOF
chmod +x start.sh cpuminer-conf.json

echo "setup nearly complete."
echo "Edit the config with \"nano ~/cpuminer/cpuminer-conf.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/cpuminer; ./start.sh\"."
