#1 Download pure openWRT source code from gary's github
#echo "Downloading openWRT source code..."
#git clone https://github.com/garyvan/openwrt-1.7.git

#2 Setup the relative path and .config for furthur usage
echo "Setup default .config..."
./redirectpath.sh

#3 Copy feed.tgz and dl.tgz to current place from our server : Z:\public\Sonicwall\Source-Code\openwrt-1.7
cd ./trunk

echo "Copy dl.tgz and feeds.tgz..."
cp /data/public/Sonicwall/Source-Code/openwrt-1.7/2015-12-11-* .

#4 Untar feed.tgz and dl.tgz
echo "Un-tar dl.tgz and feeds.tgz..."
tar -zxvf 2015-12-11-dl.tgz 
tar -zxvf 2015-12-11-feeds.tgz

rm -rf 2015-12-11-*

#5 Install feeds into package
echo "Install all application in feeds to package..."
./scripts/feeds install -a

#6 Use 'make defconfig' to let the system do the rest setting of .config for us
echo "Use "make defconfig" for the rest setting..."
make defconfig

#7 Now the environment setup is complete, we can sumply type 'make' under folder ./trunk to generate the firmware image.
echo "Environment setup finished."