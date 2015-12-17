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

# installing font for Emoji support:
apt-get -y install ttf-ancient-fonts

# installing Windows fonts:
#apt-get -y install msttcorefonts && fc-cache -fv

# installing Dropbox from repo:
#add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
#apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#apt-get update
#apt-get -y install python-gpgme dropbox

# installing newer version of LibreOffice:
#add-apt-repository ppa:libreoffice/ppa && apt-get update

# for nvidia videocards:
#apt-get -y install nvidia-current-updates nvidia-settings-updates

# for touch-screens:
#apt-get -y install xinput-calibrator

# for kvm virtualization:
#apt-get -y install qemu qemuctl

# disable dnsmasq:
[ -f /etc/NetworkManager/NetworkManager.conf ] && sed -e '/dns=dnsmasq/ s/^#*/#/' -i /etc/NetworkManager/NetworkManager.conf

apt-get -y autoremove

mkdir -p ~/.compose-cache
