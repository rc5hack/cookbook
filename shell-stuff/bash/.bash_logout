# ~/.bash_logout: executed by bash(1) when login shell exits.

# kill ssh-agent, if there is
if [ -n "$SSH_AUTH_SOCK" ] ; then
    [ -x /usr/bin/ssh-agent ] && eval `/usr/bin/ssh-agent -k`
fi

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
