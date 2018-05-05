# Superfancy bash prompt, creds to Sorin Ionescu
BLUE="\[$(tput setaf 4)\]"
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

GIT_BRANCH='$(BRANCH="$(git branch 2> /dev/null | grep "* " )"; if [ ! "${BRANCH}" == "" ]; then printf "[${BRANCH:2}] "; else printf ""; fi)'
SHORT_PATH='$(p="${PWD#${HOME}}"; [ "${PWD}" != "${p}" ] && printf "~";IFS=/; for q in ${p:1}; do printf /${q:0:1}; done; printf "${q:1}")'
export PS1="${BLUE}${SHORT_PATH} ${GREEN}${GIT_BRANCH}${RESET}❯❯❯ "
