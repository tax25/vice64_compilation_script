#! /usr/bin/sh

apt-get update -y
apt-get upgrade -y

# install svn to download source code
apt-get install subversion -y

if [ ! -d viceSrcDir ]
then
	mkdir viceSrcDir
fi

cd viceSrcDir

svn checkout https://svn.code.sf.net/p/vice-emu/code/trunk trunk

apt-get install autoconf automake build-essential byacc flex xa65 gawk libgtk-3-dev texinfo texlive-fonts-recommended texlive-latex-extra dos2unix libpulse-dev libasound2-dev libglew-dev libcurl4-openssl-dev libgif-dev libpcap-dev -y

# pwd

cd trunk/vice

# pwd

./autogen.sh

if [ $? != 0 ]
then
	echo "./autogen.sh exited with an error, exiting the script..."
	exit 1
fi

./configure --enable-gtk3ui

if [ $? != 0 ]
then
	echo "./configure --enable-gtk3ui exited with an error, exiting the script..."
	exit 1
fi

make

echo "SCRIPT COMPLETED!"
