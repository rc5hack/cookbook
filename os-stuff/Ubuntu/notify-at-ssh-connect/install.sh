#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    echo "Either become root, or try sudo."
    exit 1
fi

apt-get -y --force-yes install libnotify-bin sox

mkdir -p /usr/local/alert

cp ./ssh-login-alert.sh /usr/local/alert
cp ./icon.png /usr/local/alert
cp ./sound.wav /usr/local/alert

echo '/usr/local/alert/ssh-login-alert.sh' >> /etc/ssh/sshrc
echo '/usr/local/alert/ssh-login-alert.sh' >> ~/.ssh/rc
