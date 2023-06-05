# aliases for bash (you also may place it in your /etc/profile)

alias ll='ls -l'
alias la='ls -la'
alias li='ls -ial'
alias lsa='ls -ld .*'
alias l='ls -alF'
alias lf='ls -CF'

alias df='df -h'
alias du='du -h'

alias lesr='less -r'

alias h='history'
alias hgrep='history | grep'

alias path='echo -e ${PATH//:/\\n}'

alias publickey='cat ~/.ssh/id_rsa.pub 2> /dev/null || cat ~/.ssh/id_ecdsa.pub 2> /dev/null'

alias apache_vhosts='apachectl -t -D DUMP_VHOSTS'

alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

alias scp='scp -2'
alias scp-fast='scp -c arcfour'

alias ssh='ssh -2'
alias ssh-fast='ssh -c arcfour'

alias ping='ping -v'

# tar for dummies
alias targz='tar -czvf'
alias tarbz2='tar -cjvf'
alias untar='tar -xvf'

# common typos
alias cd..='cd ..'
alias gerp='grep'

# web cat
alias wcat='wget --no-dns-cache -q -O -'
alias dog='wcat'
alias http-get-headers='curl -sS -D - -o /dev/null'
alias http-head-headers='curl -I'

# ifconfig.me
alias whatismyip='curl -- http://ifconfig.me/ip'
alias whatismyhost='curl -- http://ifconfig.me/host'

# human-friendly datetime
alias now='date +"%T"'
alias nowtime='now'
alias nowdate='date +"%d-%m-%Y"'

# nice make
alias nicemake='nice -n1 make'

# redo previous command
alias r='fc -s'

# screen(1) wrapper
alias alive_screen='
if [ -n "`screen -ls | grep ALIVE_SCREEN`" ]; then
    if [ -n "`screen -ls | grep ALIVE_SCREEN | grep Attached`" ]; then
        if [ -z "`echo $TERMCAP | grep screen`" ]; then
            echo "Enter into Atached screen";
            sleep 1;
            screen -x ALIVE_SCREEN ;
        else
            echo "Already in ALIVE_SCREEN" ;
        fi
    else
        screen -r ALIVE_SCREEN ;
    fi
else
    screen -S ALIVE_SCREEN ;
fi'

# just a kidding
alias bitch,='sudo'

# commit a suicide
alias suicide='kill -9 $$'

# take French leave
alias french_exit='unset HISTFILE && exit'
