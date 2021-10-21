#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Downloading base16-tomorrow-night.sh module" && \
curl "https://raw.githubusercontent.com/chriskempson/base16-shell/023727241e448ee37b478261c3dda1121395cbc8/scripts/base16-tomorrow-night.sh" -o $DIR/modules/base16-tomorrow-night.sh && \
echo "Downloading z.sh module" && \
curl "https://raw.githubusercontent.com/rupa/z/b82ac78a2d4457d2ca09973332638f123f065fd1/z.sh" -o $DIR/modules/z.sh && \
ln -s $DIR/bashrc ~/.bashrc && \
echo "Symlinked bash dotfiles."
