#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

apt-get -y --force-yes update
apt-get -y --force-yes upgrade

dpkg --purge \
    kontact\
    kaddressbook\
    kate\
    knotes\
    kmail\
    korganizer\
    kwalletmanager\
    pam-kwallet\
    brltty\
    ttf-indic-fonts-core\
    ttf-kacst-one\
    ttf-khmeros-core\
    ttf-lao\
    ttf-punjabi-fonts

apt-get -y --force-yes install \
    acpi\
    tree\
    htop\
    ssh\
    autossh\
    vim\
    curl\
    links\
    whois\
    mc\
    screen\
    tmux\
    p7zip-full

apt-get -y install unrar || apt-get -y install unrar-free
apt-get -y install mtr-tiny || apt-get -y install mtr

if [ ! -s $DISPLAY ]; then apt-get -y install vncviewer; else echo "No X found - so don't install vncviewer"; fi;

# remember of heartbleed bug:
apt-get -y --force-yes install \
    openssl\
    libssl1.0.0\
    libssl-dev\
    libssl-doc

# installing Windows fonts from repo:
#apt-get -y --force-yes install msttcorefonts && fc-cache -fv

# installing Dropbox from repo:
#lsb_release -c | awk '{print "deb http://linux.dropbox.com/ubuntu " $2 " main"}' >> /etc/apt/sources.list
#apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#apt-get update
#apt-get -y --force-yes install python-gpgme dropbox

# for nvidia videocards:
#apt-get -y --force-yes install nvidia-current-updates nvidia-settings-updates

# for touch-screens:
#apt-get -y --force-yes install xinput-calibrator

# for kvm virtualization:
#apt-get -y --force-yes install qemu qemuctl

apt-get -y --force-yes autoremove

mkdir -p ~/.compose-cache
