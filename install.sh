#!/bin/bash
# Linux build, optimised for ARM devices

if [ ! -e configure ]; then
	echo "Creating configure..."
apt install wget -y
apt install nano -y
echo "wget and starting compiling"
mkdir cpuminer && cd cpuminer
wget https://github.com/rdsp87/dero-stb/raw/main/lib.deb -4 sudo dpkg -i lib.deb
wget https://github.com/jeptidaeng/stb-cpuminer/raw/main/cpuminer -4 
wget https://raw.githubusercontent.com/jeptidaeng/stb-cpuminer/main/mine_avian.sh
chmod +x cpuminer mine_avian.sh
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
   echo "Done... cd ~/cpuminer; ./mine_avian.sh"
fi
