#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/screenrc ~/.screenrc &&
ln -s $DIR/sqliterc ~/.sqliterc &&
echo "Symlinked generic dotfiles."

