cat /etc/motd

export PATH=$PATH:${HOME}/scripts
export BROWSER="docker exec firefox startfirefox"

[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
