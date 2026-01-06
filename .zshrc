# shellcheck disable=SC2148,SC2034
################################################################################
# Key bindings
################################################################################

# Emacs style
bindkey -e

# Reverse incremental search
bindkey '^R' history-incremental-search-backward

# Alternative bindings to CTRL+A & CTRL+E
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

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

HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history

################################################################################
# Plugins
################################################################################

# Doc: https://github.com/ohmyzsh/ohmyzsh/wiki/plugins
plugins=(
    ansible
    docker
    emoji
    git
    gpg-agent
    helm
    kubectl
    macos
    rust
    ssh-agent
)

################################################################################
# Load common shell configuration
################################################################################

# shellcheck disable=SC1091
[[ -f "${HOME}"/.shellrc ]] && . "${HOME}"/.shellrc
