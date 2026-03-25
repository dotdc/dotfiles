# shellcheck disable=SC2148,SC2034,SC2016
################################################################################
# Key bindings
################################################################################

# Emacs style
bindkey -e

# Alternative bindings to CTRL+A & CTRL+E
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

# Autocompletion
autoload -Uz compinit
compinit

# Shell options
setopt autocd beep nomatch promptsubst

################################################################################
# Prompt
################################################################################

RPROMPT='$(tf_prompt_info) $(date +%Y-%m-%d\ %H:%M:%S)'

PROMPT='%(?.🟢.🔴 [$?]) %F{204}david%f%F{7}@%f%F{46}macos%f %F{7}%1~%f%F{45}$(__git_ps1)%f %F{45}$ %f'

################################################################################
# Environment Variables
################################################################################

HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history

################################################################################
# Zinit & Plugins
################################################################################

# Load Zinit
# shellcheck disable=SC1091
source /usr/share/zinit/zinit.zsh

# Completion system
autoload -Uz compinit
compinit

# OMZ Libs
zinit snippet OMZ::lib/async_prompt.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# OMZ Plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/terraform/terraform.plugin.zsh

# MacOS specific plugin
[[ "$(uname -s)" == "Darwin" ]] && zinit snippet OMZ::plugins/macos/macos.plugin.zsh

################################################################################
# Load common shell configuration
################################################################################

# shellcheck disable=SC1091
[[ -f "${HOME}"/.shellrc ]] && . "${HOME}"/.shellrc
