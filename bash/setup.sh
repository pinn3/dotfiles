#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Downloading base16-tomorrow-night.sh module" && \
curl "https://raw.githubusercontent.com/chriskempson/base16-shell/023727241e448ee37b478261c3dda1121395cbc8/scripts/base16-tomorrow-night.sh" -o $DIR/modules/base16-tomorrow-night.sh && \
echo "Downloading z.sh module" && \
curl "https://raw.githubusercontent.com/rupa/z/78f0d97d3dd334109fb42502c1b3d46c9ab3482d/z.sh" -o $DIR/modules/z.sh && \
ln -s $DIR/bashrc ~/.bashrc && \
echo "Symlinked bash dotfiles."
