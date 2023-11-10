# aliases for bash (you also may place it in your /etc/profile)

alias reboot='  DELAY_TIMEOUT=10 && echo && echo "Performing \"reboot\"   command in $DELAY_TIMEOUT seconds - press Ctrl+C to abort during countdown!" && echo && DELAY_START="$(($(date +%s) + $DELAY_TIMEOUT))" && while [ "$DELAY_START" -ge `date +%s` ]; do TIME_LEFT="$(( $DELAY_START - `date +%s` ))" && echo -e "\r\033[1A\033[0Kcountdown: $(date -u -d "@$TIME_LEFT" +%M:%S)" && sleep 0.25 ; done && echo "Command was NOT aborted. Continue." && reboot'
alias shutdown='DELAY_TIMEOUT=10 && echo && echo "Performing \"shutdown\" command in $DELAY_TIMEOUT seconds - press Ctrl+C to abort during countdown!" && echo && DELAY_START="$(($(date +%s) + $DELAY_TIMEOUT))" && while [ "$DELAY_START" -ge `date +%s` ]; do TIME_LEFT="$(( $DELAY_START - `date +%s` ))" && echo -e "\r\033[1A\033[0Kcountdown: $(date -u -d "@$TIME_LEFT" +%M:%S)" && sleep 0.25 ; done && echo "Command was NOT aborted. Continue." && shutdown'
alias halt='    DELAY_TIMEOUT=10 && echo && echo "Performing \"halt\"     command in $DELAY_TIMEOUT seconds - press Ctrl+C to abort during countdown!" && echo && DELAY_START="$(($(date +%s) + $DELAY_TIMEOUT))" && while [ "$DELAY_START" -ge `date +%s` ]; do TIME_LEFT="$(( $DELAY_START - `date +%s` ))" && echo -e "\r\033[1A\033[0Kcountdown: $(date -u -d "@$TIME_LEFT" +%M:%S)" && sleep 0.25 ; done && echo "Command was NOT aborted. Continue." && halt'
alias poweroff='DELAY_TIMEOUT=10 && echo && echo "Performing \"poweroff\" command in $DELAY_TIMEOUT seconds - press Ctrl+C to abort during countdown!" && echo && DELAY_START="$(($(date +%s) + $DELAY_TIMEOUT))" && while [ "$DELAY_START" -ge `date +%s` ]; do TIME_LEFT="$(( $DELAY_START - `date +%s` ))" && echo -e "\r\033[1A\033[0Kcountdown: $(date -u -d "@$TIME_LEFT" +%M:%S)" && sleep 0.25 ; done && echo "Command was NOT aborted. Continue." && poweroff'

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

alias errgrep='grep -aiE "error|fail|fault|timeout|traceback|fatal|panic" '
alias excgrep='grep --exclude-dir=.ansible --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox --exclude-dir=.vscode-server --exclude-dir=.docker'
alias grep-ssh-config='
resolve_grep_ssh_config(){
    grep -EiA1 "^\s*Host\s+.*$1.*$"     ~/.ssh/config | GREP_COLOR=36 grep -i -e"^" -e"--" -e"$1" ||
    grep -EiB1 "^\s*HostName\s+.*$1.*$" ~/.ssh/config | GREP_COLOR=36 grep -i -e"^" -e"--" -e"$1"
}; resolve_grep_ssh_config'

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
alias ssl-check-cert='
resolve_ssl_check_cert(){
    if [ -z "$@" ]; then
        echo "Usage: ssl-check-cert DOMAIN_OR_URL";
        return 1;
    elif (echo "$@" | grep -iPq "^(?:https?:\/\/(?:www\.|(?!www))[a-z0-9][a-z0-9-]+[a-z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-z0-9]+\.[^\s]{2,})$"); then
        local url_proto; local url_domain; local url_uri;
        IFS=/ read -r url_proto _ url_domain url_uri <<<"$@";
    else
        local url_domain="$@";
    fi
    local url_port=$(echo "${url_domain}" | awk -F":" "{ print \$2 }");
    if [ -z "${url_port}" ]; then url_port="443"; url_domain="${url_domain}:443"; fi;
    echo "\"${url_domain}\" SSL certificate properties:"; </dev/null timeout 5 openssl s_client -connect "${url_domain}" 2>/dev/null |
    openssl x509 -text -noout |
    /usr/bin/env grep -Eio "(:?Issuer:|Validity|Not (:?Before|After)|Subject:|Public Key Algorithm:|Public.Key:).*";
}; resolve_ssl_check_cert'

# ifconfig.me
alias whatismyhost='curl -sSw"\n" -L --max-redirs 3 -- http://ifconfig.me/host'
alias whatismyip='  curl -sSw"\n" -L --max-redirs 3 -- http://ifconfig.me/ip'
alias whatismyipv4='curl -sSw"\n" -L --max-redirs 3 --ipv4 -- http://ifconfig.me/ip'
alias whatismyipv6='curl -sSw"\n" -L --max-redirs 3 --ipv6 -- http://ifconfig.me/ip'

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
