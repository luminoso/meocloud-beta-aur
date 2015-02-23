#!/bin/bash
# delete possible old files from last build attempt
rm -r src/ usr/ opt/
rm *.tar*

# download new tarballs
wget https://meocloud.pt/binaries/linux/x86_64/meocloud-gui-latest_x86_64_beta.tar.gz
wget https://meocloud.pt/binaries/linux/i386/meocloud-gui-latest_i386_beta.tar.gz 

# unzip new tarbal
tar zxf meocloud-gui-latest_x86_64_beta.tar.gz

# get the latest version
cat ./opt/meocloud/gui/meocloud_gui/VERSION
echo ""

# get the new md5sums for the new PKGBUILD file
md5sum meocloud-gui-latest_x86_64_beta.tar.gz
md5sum meocloud-gui-latest_i386_beta.tar.gz

# fix file permissions
chmod 644 PKGBUILD

# create new AUR package
makepkg --source

# cleanup
rm -r src/ usr/ opt/
rm *.tar*
