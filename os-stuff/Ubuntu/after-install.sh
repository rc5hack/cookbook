#!/usr/bin/env bash

# (K)Ubuntu after-install script. Suitable for server and desktop environments.
# HOWTO: just run this script with root privileges.
# cd && curl -Lo after-install.sh https://raw.githubusercontent.com/rc5hack/cookbook/master/os-stuff/Ubuntu/after-install.sh && chmod 700 ./after-install.sh && sudo ./after-install.sh

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

apt-get -y update

dpkg --purge \
    baloo\
    kontact\
    kaddressbook\
    kate\
    knotes\
    kmail\
    korganizer\
    kwalletmanager\
    pam-kwallet\
    modemmanager\
    brltty\
    ttf-indic-fonts-core\
    ttf-kacst-one\
    ttf-khmeros-core\
    ttf-lao\
    ttf-punjabi-fonts

#apt-get -y --force-yes upgrade

apt-get -y install \
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
    p7zip-full\
    openssl\
    libssl-dev

apt-get -y install unrar || apt-get -y install unrar-free
apt-get -y install mtr-tiny || apt-get -y install mtr

if [ ! -s $DISPLAY ]; then apt-get -y install vncviewer; else echo "No X found - so don't install vncviewer"; fi;

# installing Windows fonts from repo:
#apt-get -y install msttcorefonts && fc-cache -fv

# installing Dropbox from repo:
#lsb_release -c | awk '{print "deb http://linux.dropbox.com/ubuntu " $2 " main"}' >> /etc/apt/sources.list
#apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#apt-get update
#apt-get -y install python-gpgme dropbox

# for nvidia videocards:
#apt-get -y install nvidia-current-updates nvidia-settings-updates

# for touch-screens:
#apt-get -y install xinput-calibrator

# for kvm virtualization:
#apt-get -y install qemu qemuctl

apt-get -y autoremove

mkdir -p ~/.compose-cache
