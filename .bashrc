# Bash Config
################################################################################
#                              SHELL OPTIONS
################################################################################

shopt -s histappend
shopt -s checkwinsize
shopt -s expand_aliases

################################################################################
#                                ENV VARS
################################################################################

export LANG=en_US.UTF-8
#export PATH=~/scripts:$PATH
export TERM=rxvt-unicode-256color

export VISUAL="/usr/bin/vim -p -X"
export EDITOR=/usr/bin/vim

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export HISTIGNORE='pwd:clear'
export HISTTIMEFORMAT="$(echo -e '\e[38;5;202m')| %d/%m/%Y %T |$(echo -e '\e[38;5;46m') "

################################################################################
#                                ALIASES
################################################################################

alias vi="vim -b"
alias vim="vim -b"

alias ls="ls --color=auto"
alias ll="ls -hails --color=auto"

alias grep="grep --color=auto --binary-files=without-match --devices=skip"

alias motd="cat /etc/motd"
alias wan="dig +short myip.opendns.com @resolver1.opendns.com"

################################################################################
#                                 COLORS
################################################################################

gray=$(echo -e '\e[0;90m')
red=$(echo -e '\e[0;91m')
green=$(echo -e '\e[0;92m')
yellow=$(echo -e '\e[0;93m')
blue=$(echo -e '\e[0;94m')
magenta=$(echo -e '\e[0;95m')
cyan=$(echo -e '\e[0;96m')
white=$(echo -e '\e[0;97m')
black=$(echo -e '\e[0;97m')

################################################################################
#                                FUNCTIONS
################################################################################

# Molokai colors for man
function man
{
    env LESS_TERMCAP_mb=$(printf "\e[38;5;202m") \
    LESS_TERMCAP_md=$(printf "\e[38;5;202m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[48;5;82m\e[38;5;0m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[38;5;82m") \
    man "$@"
}

# Display the current git branch
function __git_ps1
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Open a new TMUX tab with smart name and connect to given host
function tab
{
    NAME=`echo $1 | sed 's/\(.*\)/\U\1/'`;
    tmux new-window -n ${NAME} "ssh root@$1 -p 22"
}

# Autocompletion from ansible hosts file for the 'tab' function
#complete -W "`egrep -v "^$|^\[|ssh_port|^#" ~/ansible/inventory/hosts | sort -u`" tab

################################################################################
#                             PROMPT STATEMENT
################################################################################

RED=$(echo -e '\[\e[38;5;1m\]')
WHITE=$(echo -e '\[\e[38;5;7m\]')
BLUE=$(echo -e '\[\e[38;5;45m\]')
GREEN=$(echo -e '\[\e[38;5;46m\]')
ORANGE=$(echo -e '\[\e[38;5;202m\]')

# Change char for root
if [ "`id -u`" -eq 0 ]
then
    PS1_USER="#"
else
    PS1_USER="\$"
fi

function __prompt_command
{
    EXIT=$?

    # Print return code if not 0
    if [[ $EXIT != 0 ]] ; then
        echo -e "${red}[ Return code : $EXIT ]${white}"
    fi
}

export PS1="${ORANGE}\u${WHITE}@${GREEN}\h ${WHITE}\W${BLUE}\$(__git_ps1) ${PS1_USER} ${WHITE}"
export PS2="${BLUE}⦔${WHITE} "
export PS4="${BLUE}Line ${LINENO} ✚${WHITE} "
export PROMPT_COMMAND=__prompt_command

if [[ ! "$TMUX_PANE" ]] ; then
    tmux new-session -n WORKSTATION
fi
