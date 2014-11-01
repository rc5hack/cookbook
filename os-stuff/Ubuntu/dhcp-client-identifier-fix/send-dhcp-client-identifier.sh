#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    echo "Either become root, or try sudo."
    exit 1
fi

echo "send dhcp-client-identifier 1:"`ifconfig | grep HWaddr | grep eth0 | awk '{print $5}'` >> /etc/dhcp/dhclient.conf
