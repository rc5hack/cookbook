bash(1) dotfiles
================

terminology
-----------
An *interactive shell* is a shell with which you can interact, that means you can type commands in it. A *non-interactive shell* is a shell with which you cannot interact. Non-interactive shells are usually started to run shell scripts.

A *login shell* is a shell which is started when you login to your system, or when you start bash using the `--login` option. A *non-login* shell is a shell which is started after the login process, and without the `--login` option.

bash(1) startup
---------------
When bash(1) starts, it executes the commands in a variety of scripts.

When **started as an interactive login shell,**
* Bash reads and executes /etc/profile (if it exists).
* After that, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile in that order, and reads and executes the first one that exists and is readable.

Since everything you run from your login shell inherits the login shell's environment, you should put all your environment variables in there.

When a login shell exits,
* Bash reads and executes ~/.bash_logout (if it exists).

When **started as an interactive non-login shell,**
* Bash reads and executes ~/.bashrc (if it exists). This may be inhibited by using the --norc option.

Once you log in, you can run several more shells. Your environment variables were passed along in the whole chain, so your non-login shells don't need to load them anymore. So define here everything that only applies to bash. That's functions, aliases, bash-only variables like HISTSIZE (this is not an environment variable, don't export it!), shell options with set and shopt, etc.

Now, as part of UNIX peculiarity, a login-shell does NOT execute ~/.bashrc, so you should source that one manually from the latter.

known issues
------------
Note, that in many OS, like Linux Mint, when you log in under X, startup scripts are executed by `/bin/sh`, which could be symlink not to `bash`. On Ubuntu and Mint, `/bin/sh` is `dash`, not `bash`. So that way `~/.bash_profile` wouldn't source when X starts.

see also
--------
* http://en.wikipedia.org/wiki/Bash_(Unix_shell)
* http://stackoverflow.com/questions/902946
* http://unix.stackexchange.com/questions/88106
