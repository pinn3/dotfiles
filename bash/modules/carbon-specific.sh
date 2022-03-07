if [ -e /home/pinn3/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pinn3/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(direnv hook bash)"

cat /etc/motd

export PATH=${HOME}/scripts:$PATH
export BROWSER="docker exec firefox startfirefox"

[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
