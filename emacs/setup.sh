#!/usr/bin/env bash
set -e

here=$(realpath $(dirname "$0"))

ln -sfn $here/dot-emacs-d ~/.emacs.d
echo "Symlinked emacs configuration"
