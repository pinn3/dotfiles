#!/usr/bin/env bash
set -e

here=$(realpath $(dirname "$0"))

echo "Downloading base16-tomorrow-night.sh module"
curl -s "https://raw.githubusercontent.com/chriskempson/base16-shell/023727241e448ee37b478261c3dda1121395cbc8/scripts/base16-tomorrow-night.sh" -o $here/modules/base16-tomorrow-night.sh
echo "ef4493c0ce6c14a489b2311603013faf0c7a5f581d59c038562b13d82cab1ccd  $here/modules/base16-tomorrow-night.sh" | sha256sum --check

echo "Downloading z.sh module"
curl -s "https://raw.githubusercontent.com/rupa/z/b82ac78a2d4457d2ca09973332638f123f065fd1/z.sh" -o $here/modules/z.sh
echo "98e4438cd31afb3ce594130335e7fbd8be5d75d9a53e4f3e084d97e6b8d19b0e  $here/modules/z.sh" | sha256sum --check

ln -s $here/bashrc ~/.bashrc
echo "Symlinked bash configuration"
