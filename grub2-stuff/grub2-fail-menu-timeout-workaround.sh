#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    echo "Either become root, or try sudo."
    exit 1
fi

# If the last boot failed or after a boot into Recovery Mode,
# grub menu will be displayed until the user makes a selection.
# The timeout setting in /etc/default/grub do not apply in this case.
#
# See https://help.ubuntu.com/community/Grub2
#
# So, if you deal with remote machine, it may come to impossibility-to-start state.
#
# To change this behaviour, edit /etc/grub.d/00_header and change line in the make_timeout() function:
#
# -1, there will be no countdown and thus the menu will display
# 0, menu will not display even for a failed startup
# >=1, menu will display for the specified number of seconds

grub_fail_menu_timeout="3"

if [ -f "/etc/grub.d/00_header" ]
    then
        echo "Patching..."
        eval "perl \
            -e 's/^[ \t]*set timeout=\\\${GRUB_RECORDFAIL_TIMEOUT:--1}[ \t]*$/  set timeout=${grub_fail_menu_timeout}/ig' \
            -pi /etc/grub.d/00_header"
        update-grub
        echo "Done!"
    else
        echo "File not found! Nothing to do."
        exit 1
fi
