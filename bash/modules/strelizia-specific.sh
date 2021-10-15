alias cat="bat --plain --paging=never --theme base16"
alias less="bat --plain --paging=always --theme base16"
alias diff="diff --color=always"

export PATH=$PATH:${HOME}/scripts
export BROWSER=$(which firefox)

eval "$(direnv hook bash)"

[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
