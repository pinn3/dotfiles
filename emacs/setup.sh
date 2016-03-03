#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/dot-emacs.el ~/.emacs &&
ln -s $DIR/dot-emacs-d ~/.emacs.d &&
echo "Symlinked emacs dotfiles."

