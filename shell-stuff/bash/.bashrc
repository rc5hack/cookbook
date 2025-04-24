# ~/.bashrc: executed by bash(1) for non-login shells.

# Skip this config if we aren't in bash
[[ -n "${BASH_VERSION}" ]] || return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Automatically start ssh-agent on login, if not already running
SSH_AGENT_ENV="$HOME/.ssh/ssh-agent.env"
function check_ssh_agent {
    [[ -n "$SSH_AUTH_SOCK" ]] && \
    [[ -S "$SSH_AUTH_SOCK" ]] && \
    ps -p "$SSH_AGENT_PID" > /dev/null 2>&1 && \
    echo "SSH agent is running, PID '$SSH_AGENT_PID'"
}
function start_ssh_agent {
    if [ -x "$(command -v ssh-agent)" ]; then
        echo "Initializing new SSH agent..."
        (umask 077; ssh-agent -s > "$SSH_AGENT_ENV")
        source "$SSH_AGENT_ENV" > /dev/null
    else
        echo "Can't initialize SSH agent (executable not found), consider installing it."
    fi
}
if [ -f "$SSH_AGENT_ENV" ] && [ -r "$SSH_AGENT_ENV" ] && [ -s "$SSH_AGENT_ENV" ]; then
    source "$SSH_AGENT_ENV" > /dev/null
    check_ssh_agent || start_ssh_agent
else
    start_ssh_agent
fi

# Skip the rest if we aren't in interactive shell
if [ -z "${PS1}" -a "$-" != "*i*" ]; then return; fi

# history
HISTSIZE=32768
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
# ignoreboth = ignorespace + ignoredups
HISTCONTROL=ignoreboth
HISTIGNORE='pwd:history:hgrep:exit:fg:cd .:explorer.exe .'
# do not immediately pass the results of history substitution to the shell parser
# instead, load it to editing buffer, allowing further modification
shopt -sq histverify
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# include .bash_aliases if exists
# see /usr/share/doc/bash-doc/examples in the bash-doc package
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
if [ -d ~/.bash_aliases.d/ ]; then
    for aliases_file in $(find ~/.bash_aliases.d/ -maxdepth 1 -type f -print); do
        source "$aliases_file"
    done
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
# set variable with custom hostname for prompt
if [ -r ~/.bash_ps_hostname ] && [ -s ~/.bash_ps_hostname ] ; then
    custom_hostname="@"`head -q -n1 -- ~/.bash_ps_hostname`
else
    custom_hostname=''
fi
# colorize prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
fi
if [ "$color_prompt" = yes ]; then
    if [ "$LOGNAME" = root ] || [ "`id -u`" -eq 0 ] ; then
        if [ -r ~/.bash_ps_local ] ; then
            # local root
            PS1="${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u${custom_hostname}\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ "
        else
            # non-local root
            PS1="${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u${custom_hostname}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
        fi
    else
        if [ -r ~/.bash_ps_local ] ; then
            # local non-root
            PS1="${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u${custom_hostname}\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ "
        else
            # non-local non-root
            PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u${custom_hostname}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
        fi
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset custom_hostname
unset color_prompt

# if this is xterm, set title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# include bash_completion script if exists
if [ -f ~/.bash_completion ]; then
    source ~/.bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi
