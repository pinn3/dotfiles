#!/usr/bin/env bash
set -e

here=$(realpath $(dirname "$0"))

ln -s $here/gitignore_global ~/.gitignore_global
ln -s $here/gitconfig ~/.gitconfig
echo "Symlinked git configuration"

