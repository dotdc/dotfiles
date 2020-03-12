#!/bin/bash
################################################################################
# Shell Options
################################################################################

shopt -s histappend
shopt -s checkwinsize
shopt -s expand_aliases

################################################################################
# Environment Variables
################################################################################

export LANG="en_US.UTF-8"
export TERM="rxvt-unicode-256color"

export VISUAL="/usr/bin/vim -p -X"
export EDITOR="/usr/bin/vim"

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export HISTIGNORE="pwd:clear"
export HISTTIMEFORMAT="| %d/%m/%Y %T | "

################################################################################
# Aliases
################################################################################

# Default
alias vi="vim -b"
alias vim="vim -b"
alias ls="ls --color=auto"
alias ll="ls -hails --color=auto"
alias grep="grep --color=auto --binary-files=without-match --devices=skip"
alias tree="tree -C --dirsfirst"
alias wan="dig +short myip.opendns.com @resolver1.opendns.com"

# Archlinux
alias pacman="sudo pacman --color auto"

# Kubernetes
alias k="kubectl"
alias kk="k3s kubectl"

################################################################################
# Colors
################################################################################

export W="\\e[0m"  # White
export R="\\e[91m" # Red
export G="\\e[92m" # Green
export B="\\e[96m" # Blue
export Y="\\e[93m" # Yellow
export P="\\e[95m" # Purple

################################################################################
# Functions
################################################################################

# Molokai colors for man
man()
{
    env LESS_TERMCAP_mb="$(printf "\e[38;5;202m")" \
    LESS_TERMCAP_md="$(printf "\e[38;5;202m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[48;5;82m\e[38;5;0m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[38;5;82m")" \
    man "$@"
}

# SSH to given host in a new TMUX tab
tab()
{
    # $1 = user@host
    # $2 = ssh port (default: 22)
    [[ -n $2 ]] && port=$2 || port=22
    name=$(echo "$1" | sed -e 's/.*@//' -e 's/\(.*\)/\U\1/')
    tmux new-window -n "${name}" "ssh $1 -A -p ${port} -t 'TERM=xterm ; bash'"
}

################################################################################
# Prompt
################################################################################

WHITE=$(echo -e "\[\e[38;5;7m\]")
BLUE=$(echo -e "\[\e[38;5;45m\]")
GREEN=$(echo -e "\[\e[38;5;46m\]")
ORANGE=$(echo -e "\[\e[38;5;202m\]")

# Display the current git branch
__git_ps1()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Print return code if not 0 
__prompt_command()
{
    EXIT=$?
    [[ ${EXIT} != 0 ]] && echo -e "${R}[ Return code : ${EXIT} ]${W}"
}

export PS1="${ORANGE}\u${WHITE}@${GREEN}\h ${WHITE}\W${BLUE}\$(__git_ps1) $ ${WHITE}"
export PS2="${BLUE}>${WHITE} "
export PS4="${BLUE}Line ${LINENO} >${WHITE} "
export PROMPT_COMMAND=__prompt_command

################################################################################
# Automatic actions
################################################################################

# Start tmux automatically
if [[ ! "${TMUX_PANE}" && "${TERM_PROGRAM}" != "vscode" ]] ; then
    tmux new-session -n WORKSTATION
fi

################################################################################
# Source custom 
################################################################################

# shellcheck disable=SC1090
[[ -f ~/.bashrc_imrtfm ]] && . ~/.bashrc_imrtfm || true
