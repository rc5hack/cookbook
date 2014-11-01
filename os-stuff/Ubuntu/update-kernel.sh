#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

#apt-get -y --force-yes install dkms

mkdir -p ~/kernel
cd ~/kernel
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.4-precise/linux-headers-3.4.0-030400_3.4.0-030400.201205210521_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.4-precise/linux-headers-3.4.0-030400-generic_3.4.0-030400.201205210521_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.4-precise/linux-image-3.4.0-030400-generic_3.4.0-030400.201205210521_amd64.deb
dpkg -i *.deb
