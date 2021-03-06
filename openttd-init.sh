#!/bin/bash

#unused as of now
outpt = $(getconf _NPROCESSORS_ONLN)

echo "this step will depend on the internet connection to the server"
echo "[......]"
wget https://binaries.openttd.org/releases/1.8.0/openttd-1.8.0-source.tar.gz > /dev/null 2>&1
echo "[=.....]"
tar xzf openttd-1.8.0-source.tar.gz > /dev/null 2>&1
echo "[==....]"
yes | sudo apt-get install build-essential pkg-config libsdl1.2-dev subversion patch zlib1g-dev liblzo2-dev liblzma-dev libfontconfig-dev libicu-dev > /dev/null 2>&1
echo "[===....]"
pushd openttd-1.8.0/
./configure --enable-dedicated > /dev/null 2>&1
echo "[====...]"
echo "this step may take as long as 20 minutes, please be patient. If it fails, you'll know."
make --jobs=1 > /dev/null 2>&1
sudo make install > /dev/null 2>&1
echo "[=====..]"
wget http://binaries.openttd.org/bananas/basegraphic/zBase-v5588.tar.gz > /dev/null 2>&1
gunzip zBase-v5588.tar.gz > /dev/null 2>&1
mkdir -p .openttd/baseset
mv zBase-v5588.tar .openttd/baseset
echo "[======.]"
touch ~/.openttd/openttd.cfg
echo "generating openttd.cfg..."
sudo service openttd start
sudo service openttd stop
echo "[=======]"
echo "installation complete, save files, openttd.cfg et al are located in the directory ~/.openttd/"
