#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(mkdir -p ~/.config/alacritty/ && ln -s $DIR/alacritty.yml ~/.config/alacritty/alacritty.yml && echo "Symlinked Alacritty configuration")
(mkdir -p ~/.config/keynav/ && ln -s $DIR/keynavrc ~/.config/keynav/keynavrc && echo "Symlinked keynav configuration")
(ln -s $DIR/screenrc ~/.screenrc && echo "Symlinked GNU screen configuration")
(ln -s $DIR/sqliterc ~/.sqliterc && echo "Symlinked SQLite configuration")
