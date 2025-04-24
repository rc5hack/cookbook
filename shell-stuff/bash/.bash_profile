# ~/.bash_profile: executed by bash(1) for login shells.

# include .profile if exists
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# default 4.2 behavior, where disk information is shown in K-Blocks
export BLOCKSIZE=K

# color terminal
export CLICOLOR=1

# colors for ls(1)
export LSCOLORS='dxfxcxdxbxegedabagacad'

# colors for less(1), usefull for manpages and even more
export LESS_TERMCAP_us=$'\E[04;32m'    # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # end underline
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode
export LESS_TERMCAP_se=$'\E[0m'        # end standout-mode
export LESS_TERMCAP_md=$'\E[01;32m'    # begin bold
export LESS_TERMCAP_mb=$'\E[05;32m'    # begin blinking
export LESS_TERMCAP_me=$'\E[0m'        # end mode

# set pager
export PAGER='env LESS_IS_MORE=1 less -FRX'

# set editor
exists vim && EDITOR=vim || {
exists vi && EDITOR=vi; }
export EDITOR

# set diff
exists colordiff && alias diff='colordiff'

if [ "$(id -ur)" = "0" ]; then
    PS1='\[\033[1;31m\][\u@\h \[\033[1;34m\]\w\[\033[1;31m\]]\$\[\033[0m\] '
    export HOME=/root
else
    PS1='\[\033[1;32m\][\u@\h \[\033[1;34m\]\w\[\033[1;32m\]]\$\[\033[0m\] '
fi

# include .bashrc if exists and we aren't in login shell
# (this is to avoid double sourcing .bashrc)
if [[ -f ~/.bashrc ]] && ! shopt -q login_shell; then
    source ~/.bashrc
fi

# include custom motd if exists
if [ -f ~/bin/motd.sh ]; then
    source ~/bin/motd.sh
fi
