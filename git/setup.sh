#!/bin/bash

echo "work/personal?: "
read type

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/gitignore_global ~/.gitignore_global &&
ln -s $DIR/gitconfig_$type ~/.gitconfig &&
echo "Symlinked git dotfiles."

