# ~/.cshrc

set prompt = '%{^[[40;32;1m%}[%n@%m %$cwd]#%{^[[0m%} '

set autolist # list matching words by hitting <TAB>

# let Insert, Delete, PageUP, PageDown keys work properly in csh under FreeBSD:
bindkey '\e[2~' overwrite-mode
bindkey '\e[3~' delete-char
bindkey '^[[5~' history-search-backward
bindkey '^[[6~' history-search-forward

# let Ctrl-left-arrow and Ctrl-right-arrow jump over words:
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
