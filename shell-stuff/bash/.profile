# ~/.profile: executed by the command interpreter for login shells.
# This file should not be read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# command-exists-check
exists() {
    test -x "$(command -v "$1")" || alias "$1" > /dev/null 2>&1
}

# PATH manipulations
[ -d "$HOME/bin" ] && echo -n "$PATH" | grep -vq "$HOME/bin:" && PATH="$HOME/bin:$PATH"
[ -d "/opt/java" ] && PATH="$PATH:/opt/java/bin"

# locale for formatting numbers - keep POSIX (default)
export LC_NUMERIC=POSIX

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
