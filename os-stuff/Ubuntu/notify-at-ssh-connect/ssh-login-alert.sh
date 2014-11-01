#!/usr/bin/env bash

export DISPLAY=:0
notify-send "Security Warning" "SSH connection established! \n Logged in as user \"$USER\" $(echo $SSH_CONNECTION $SSH_TTY | sed 's/\(.*\) \(.*\) \(.*\) \(.*\) \(.*\)/at \5 from \1:\2 to \3:\4/')" -t 5000 -u critical -i /usr/local/alert/icon.png
play -q -- /usr/local/alert/sound.wav > /dev/null 2>&1 &
