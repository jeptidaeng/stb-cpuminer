#!/bin/bash
# Linux build, optimised for ARM devices

if [ ! -e configure ]; then
	echo "Creating configure..."
apt install wget -y
apt install nano -y
echo "wget and starting compiling"
mkdir stb-cpuminer && cd stb-cpuminer
wget https://github.com/jeptidaeng/stb-cpuminer/raw/main/arm64.deb
wget https://github.com/jeptidaeng/stb-cpuminer/raw/main/cpuminer 
wget https://github.com/jeptidaeng/stb-cpuminer/main/mine_avian.sh
chmod +x stb-cpuminer mine_avian.sh
echo "  => done."
	else
		exit 1
	fi
if [ $? != 0 ]; then
echo '$ ls -l ccminer'
ls -l ccminer

echo "Stripping..."

strip -s ccminer

[ $? = 0 ] || exit $?
echo "  => done."
else
   echo "Done... cd ~/ccminer; ./start.sh"
fi
