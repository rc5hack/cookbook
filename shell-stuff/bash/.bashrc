# ~/.bashrc: executed by bash(1) for non-login shells.

# Skip this config if we aren't in bash
[[ -n "${BASH_VERSION}" ]] || return

# SSH agent admitted failure to sign using the key workaround
# see https://bugs.launchpad.net/ubuntu/+source/gnome-keyring/+bug/201786
#export SSH_AUTH_SOCK=0

# Skip the rest if we aren't in interactive shell
if [ -z "${PS1}" -a "$-" != "*i*" ]; then return; fi

# wrappers
ssh () {
    ssh-add -l | grep 'The agent has no identities.' 2>&1 > /dev/null && ssh-add
    /usr/bin/env ssh "$@"
}

# history
HISTSIZE=32768
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
# ignoreboth = ignorespace + ignoredups
HISTCONTROL=ignoreboth
HISTIGNORE='pwd:history:exit:fg:* --help'
# do not immediately pass the results of history substitution to the shell parser
# instead, load it to editing buffer, allowing further modification
shopt -sq histverify

# include .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# include bash_completion script if it exists
if [ -f ~/.bash_completion ]; then
    source ~/.bash_completion
else
    if [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    else
        if [ -f /usr/local/etc/bash_completion ]; then
            source /usr/local/etc/bash_completion
        fi
    fi
fi
