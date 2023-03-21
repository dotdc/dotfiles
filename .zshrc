################################################################################
# Base
################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vi key bindings
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

# Autocompletion
autoload -Uz compinit
compinit

# Shell options
setopt autocd beep nomatch

ENABLE_CORRECTION="true"

################################################################################
# Environment Variables
################################################################################

export LANG="en_US.UTF-8"
#export TERM="rxvt-unicode-256color"

export VISUAL="/usr/bin/vim -p -X"
export EDITOR="/usr/bin/vim"

export HISTSIZE=5000
export HISTFILE="~/.histfile"
export SAVEHIST=1000
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
alias yay="yay --color auto"

# Other
alias ip="ip -c"
alias docker="sudo docker"

################################################################################
# Colors
################################################################################

export W=$'\e[0m'  # White
export R=$'\e[91m' # Red
export G=$'\e[92m' # Green
export B=$'\e[96m' # Blue
export Y=$'\e[93m' # Yellow
export P=$'\e[95m' # Purple

################################################################################
# Kubernetes 
################################################################################

# Aliases
alias k="kubectl"
alias kl="kubectl config get-contexts"
alias kc="kubectl config set current-context"

# Switch namespace for the current context
kns()
{
    kubectl config set-context --current --namespace="${1}"
}

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
# Plugins
################################################################################

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)

################################################################################
# Themes
################################################################################

#eval "$(starship init zsh)"

# powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
