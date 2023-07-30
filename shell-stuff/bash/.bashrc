# ~/.bashrc: executed by bash(1) for non-login shells.

# Skip this config if we aren't in bash
[[ -n "${BASH_VERSION}" ]] || return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# automatically start ssh-agent on login
if [ -z "$SSH_AUTH_SOCK" ]; then
    [ -x "$(command -v ssh-agent)" ] && eval `ssh-agent -s`
    trap "kill $SSH_AGENT_PID" 0
fi

# SSH agent admitted failure to sign using the key workaround
# see https://bugs.launchpad.net/ubuntu/+source/gnome-keyring/+bug/201786
#export SSH_AUTH_SOCK=0

# Skip the rest if we aren't in interactive shell
if [ -z "${PS1}" -a "$-" != "*i*" ]; then return; fi

# history
HISTSIZE=32768
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
# ignoreboth = ignorespace + ignoredups
HISTCONTROL=ignoreboth
HISTIGNORE='pwd:history:hgrep:exit:fg:* --help:cd .:explorer.exe .'
# do not immediately pass the results of history substitution to the shell parser
# instead, load it to editing buffer, allowing further modification
shopt -sq histverify
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# include .bash_aliases if it exists
# see /usr/share/doc/bash-doc/examples in the bash-doc package
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# colorize prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
fi
if [ "$color_prompt" = yes ]; then
    if [ "$LOGNAME" = root ] || [ "`id -u`" -eq 0 ] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset color_prompt

# if this is xterm, set title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# include bash_completion script if it exists
if [ -f ~/.bash_completion ]; then
    source ~/.bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi
