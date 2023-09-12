#!/usr/bin/env bash

# (K)Ubuntu after-install script. Suitable for server and desktop environments.
# HOWTO: just run this script with root privileges.
# cd && curl -Lo after-install.sh https://raw.githubusercontent.com/rc5hack/cookbook/master/os-stuff/Ubuntu/after-install.sh && chmod 700 ./after-install.sh && sudo ./after-install.sh

set -eu

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

locale-gen en_US en_US.UTF-8 ru_RU ru_RU.UTF-8

apt-get -qq update

dpkg --purge \
    baloo \
    kontact \
    kaddressbook \
    kate \
    knotes \
    kmail \
    korganizer \
    kwalletmanager \
    pam-kwallet \
    modemmanager \
    brltty \
    ttf-indic-fonts-core \
    ttf-kacst-one \
    ttf-khmeros-core \
    ttf-lao \
    ttf-punjabi-fonts

#echo $(dpkg -l | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p') $(dpkg -l | grep linux-headers | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p') | xargs apt-get -y purge

#apt-get -y --force-yes upgrade

apt-get -y --no-install-recommends install -- \
    acpi \
    autossh ssh \
    bzip2 lbzip2 \
    ca-certificates \
    curl \
    dar \
    dos2unix \
    git \
    htop \
    iputils-ping net-tools \
    links \
    mc \
    openssl libssl-dev \
    p7zip-full \
    procps \
    screen \
    tmux \
    traceroute \
    tree \
    vim \
    whois

apt-get -y --no-install-recommends install -- mtr-tiny || apt-get -y --no-install-recommends install -- mtr
apt-get -y --no-install-recommends install -- unrar    || apt-get -y --no-install-recommends install -- unrar-free

if [ ! -s $DISPLAY ]; then apt-get -y install vncviewer; else echo "No X found - so don't install vncviewer"; fi;

# installing x11-utils to get luit(1) to work with non-UTF-8 applications (e.g. ssh to ancient servers) from UTF-8 terminal emulator
apt-get -y --no-install-recommends install x11-utils

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

# mc settings:
[ -f ~/.config/mc/ini ] && sed -e 's/use_internal_edit=false/use_internal_edit=true/' -e 's/use_internal_edit=0/use_internal_edit=1/' -i ~/.config/mc/ini

apt-get -y autoremove

mkdir -p ~/.compose-cache
