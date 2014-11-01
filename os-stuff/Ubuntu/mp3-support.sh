#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "You must be root to run this script!"
    exit 1
fi

apt-get -y --force-yes update

apt-get -y --force-yes install \
    libmp3lame0

apt-get -y --force-yes autoremove
