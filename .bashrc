#!/bin/bash
################################################################################
# Shell Options
################################################################################

shopt -s histappend
shopt -s checkwinsize
shopt -s expand_aliases

################################################################################
# Prompt
################################################################################

WHITE=$(echo -e "\[\e[38;5;7m\]")
BLUE=$(echo -e "\[\e[38;5;45m\]")
GREEN=$(echo -e "\[\e[38;5;46m\]")
RED=$(echo -e "\[\e[38;5;204m\]")

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

export PS1="${RED}\u${WHITE}@${GREEN}\h ${WHITE}\W${BLUE}\$(__git_ps1) $ ${WHITE}"
export PS2="${BLUE}>${WHITE} "
export PS4="${BLUE}Line ${LINENO} >${WHITE} "
export PROMPT_COMMAND=__prompt_command

################################################################################
# Load common shell configuration
################################################################################

# shellcheck disable=SC1091
[[ -f "${HOME}"/.shellrc ]] && . "${HOME}"/.shellrc
