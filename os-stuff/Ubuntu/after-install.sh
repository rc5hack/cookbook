#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

apt-get -y --force-yes update
apt-get -y --force-yes upgrade

apt-get -y purge \
    kontact\
    kwalletmanager\
    brltty\
    ttf-indic-fonts-core\
    ttf-kacst-one\
    ttf-khmeros-core\
    ttf-lao\
    ttf-punjabi-fonts

apt-get -y --force-yes install \
    dkms\
    acpi\
    ssh\
    autossh\
    vncviewer\
    vim\
    curl\
    links\
    whois\
    mc\
    screen\
    tmux\
    unrar\
    p7zip-full

# remember of heartbleed bug:
apt-get -y --force-yes install \
    openssl\
    libssl1.0.0\
    libssl-dev\
    libssl-doc

# installing Dropbox from repo:
#lsb_release -c | awk '{print "deb http://linux.dropbox.com/ubuntu " $2 " main"}' >> /etc/apt/sources.list
#apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#apt-get update
#apt-get -y --force-yes install python-gpgme dropbox

# for building "default settings" package for Ubuntu to use in a customized image:
#apt-get -y --force-yes install ubuntu-defaults-builder

# for nvidia videocards:
#apt-get -y --force-yes install nvidia-current-updates nvidia-settings-updates

# for touch-screens:
#apt-get -y --force-yes install xinput-calibrator

# for kvm virtualization:
#apt-get -y --force-yes install qemu qemuctl

apt-get -y --force-yes autoremove

mkdir -p ~/.compose-cache
