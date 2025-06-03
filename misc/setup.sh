#!/usr/bin/env bash
set -e

here=$(realpath $(dirname "$0"))

mkdir -p ~/.config/alacritty/
ln -sfn $here/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "Symlinked Alacritty configuration"

mkdir -p ~/.config/keynav/
ln -sfn $here/keynavrc ~/.config/keynav/keynavrc
echo "Symlinked keynav configuration"
