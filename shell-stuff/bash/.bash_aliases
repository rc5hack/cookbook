# aliases for bash (you also may place it in your /etc/profile)

alias diff='diff --color'
alias zdiff='zdiff --color'
alias bzdiff='bzdiff --color'
alias diff-side-by-side-all='diff -y --left-column'
alias diff-side-by-side-changes-only='diff -y --suppress-common-lines'

alias ls='ls --color'
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

alias grep='grep --color'
alias zgrep='zgrep --color'
alias bzgrep='bzgrep --color'
alias egrep='egrep --color'
alias zegrep='zegrep --color'
alias bzegrep='bzegrep --color'
alias fgrep='fgrep --color'
alias zfgrep='zfgrep --color'
alias bzfgrep='bzfgrep --color'
alias rgrep='rgrep --color'
alias excgrep='grep --exclude-dir=.ansible --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox --exclude-dir=.vscode-server --exclude-dir=.docker'

alias mc='[ "$FORCE_MC_GRAPHIC_CHARS_DISABLE" = "1" ] && mc -a || mc'
alias mcedit='[ "$FORCE_MC_GRAPHIC_CHARS_DISABLE" = "1" ] && mcedit -a || mcedit'

alias scp='scp -2'
alias ssh='ssh -2'
alias ssh-force-password-auth='ssh -o PubkeyAuthentication=no -o GSSAPIAuthentication=no -o PasswordAuthentication=yes'
alias check-for-ssh-agent='[ -x "$(command -v ssh-add)" ] && (ssh-add -l >/dev/null 2>&1 || ssh-add)'

alias apache_vhosts='apachectl -t -D DUMP_VHOSTS'

alias ansible='check-for-ssh-agent ; ansible'
alias ansible-playbook='check-for-ssh-agent ; ansible-playbook'

alias dc='resolve_docker_compose(){ docker compose version >/dev/null 2>&1 ; if [ "$?" = "0" ]; then docker compose $@ ; else docker-compose $@ ; fi }; resolve_docker_compose'
alias dc-logs-all='dc logs --no-log-prefix'
alias dc-logs-tail='dc logs --no-log-prefix --tail 1000'
alias dc-logs-tailf='dc logs --no-log-prefix --tail 0 --follow'

alias ping='ping -v'

# tar for dummies
alias targz='tar -czvf'
alias tarbz2='tar -cjvf'
alias untar='tar -xvf'

# common typos
alias cd..='cd ..'
alias gerp='grep'

# web cat and checks
alias wcat='wget --no-dns-cache -q -O -'
alias dog='wcat'
alias http-headers-get='curl -sS -D - -o /dev/null'
alias http-headers-get-accept-compressing='http-headers-get -H "Accept-encoding: gzip, deflate, br"'
alias http-headers-get-follow-redirects='http-headers-get -L --max-redirs 10'
alias http-headers-head='curl -I'
alias http-headers-head-follow-redirects='http-headers-head -L --max-redirs 10'
alias ssl-check-url='resolve_ssl_check_url(){ local url_proto; local url_domain; local url_uri; IFS=/ read -r url_proto _ url_domain url_uri <<<"$@"; local url_port=$(echo "$url_domain" | awk -F":" "{ print \$2 }"); if [ -z "${url_port}" ]; then url_port="443"; url_domain="${url_domain}:443"; fi; echo "SSL certificate for \"$url_domain\" should be valid:"; </dev/null openssl s_client -connect "${url_domain}" 2>/dev/null | openssl x509 -text -noout | grep -oE "Not (Before|After).+"; }; resolve_ssl_check_url'
alias ssl-check-host='resolve_ssl_check_host(){ local url_domain="$@"; local url_port=$(echo "$url_domain" | awk -F":" "{ print \$2 }"); if [ -z "${url_port}" ]; then url_port="443"; url_domain="${url_domain}:443"; fi; echo "SSL certificate for \"$url_domain\" should be valid:"; </dev/null openssl s_client -connect "${url_domain}" 2>/dev/null | openssl x509 -text -noout | grep -oE "Not (Before|After).+"; }; resolve_ssl_check_host'

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
