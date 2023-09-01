#!/usr/bin/env sh
set -eu

test -d "$HOME"

for DOTFILE in .bash_aliases .bash_logout .bash_profile .bashrc .inputrc .profile
do
    cp -v --no-preserve=timestamps -- "./${DOTFILE}" "${HOME}/${DOTFILE}"
done

echo "Done!"
