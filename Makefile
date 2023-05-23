# Makefile

SHELL := /bin/bash
.DEFAULT_GOAL := dotfiles

.PHONY: minimal
minimal: init bash end

.PHONY: dotfiles
dotfiles: init bash fonts git tmux xorg end

.PHONY: all
all: dotfiles vim vscode

.PHONY: init
init:
	@mkdir -p ~/.bak
	@echo "Created ~/.bak folder"

.PHONY: bash
bash:
	@cp ~/.bashrc ~/.bak/ &> /dev/null | true
	@rm ~/.bashrc &> /dev/null | true
	ln -s ${PWD}/.bashrc ~/.bashrc

	@cp ~/.bash_profile ~/.bak/ &> /dev/null | true
	@rm ~/.bash_profile &> /dev/null | true
	ln -s ${PWD}/.bash_profile ~/.bash_profile

.PHONY: zsh
zsh:
	@cp ~/.zshrc ~/.bak/ &> /dev/null | true
	@rm ~/.zshrc &> /dev/null | true
	ln -s ${PWD}/.zshrc ~/.zshrc

	@cp ~/.p10k.zsh ~/.bak/ &> /dev/null | true
	@rm ~/.p10k.zsh &> /dev/null | true
	ln -s ${PWD}/.p10k.zsh ~/.p10k.zsh

.PHONY: fonts
fonts:
	@cp -r ~/.fonts ~/.bak/ &> /dev/null | true
	@rm -r ~/.fonts &> /dev/null | true
	ln -s ${PWD}/.fonts ~/.fonts

.PHONY: git
git:
	@cp ~/.gitconfig ~/.bak/ &> /dev/null | true
	@rm ~/.gitconfig &> /dev/null | true
	ln -s ${PWD}/.gitconfig ~/.gitconfig

.PHONY: tmux
tmux:
	@cp ~/.tmux.conf ~/.bak/ &> /dev/null | true
	@rm ~/.tmux.conf &> /dev/null | true
	ln -s ${PWD}/.tmux.conf ~/.tmux.conf

.PHONY: xorg
xorg:
	@cp ~/.Xdefaults ~/.bak/ &> /dev/null | true
	@rm ~/.Xdefaults &> /dev/null | true
	ln -s ${PWD}/.Xdefaults ~/.Xdefaults

	@cp ~/.Xressources ~/.bak/ &> /dev/null | true
	@rm ~/.Xressources &> /dev/null | true
	ln -s ${PWD}/.Xressources ~/.Xressources

.PHONY: vim
vim:
	@cp ~/.vimrc ~/.bak/ &> /dev/null | true
	@rm ~/.vimrc &> /dev/null | true
	ln -s ${PWD}/.vimrc ~/.vimrc

	@cp -r ~/.vim/colors ~/.bak/ &> /dev/null | true
	@rm -r ~/.vim/colors &> /dev/null | true
	@mkdir -p ~/.vim
	ln -s ${PWD}/.vim/colors ~/.vim/colors

	@rm -rf ~/.vim/bundle/Vundle.vim | true
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

.PHONY: vscode
vscode:
	@cp ~/.config/Code/User/settings.json ~/.bak/vscode.settings.json &> /dev/null | true
	@rm ~/.config/Code/User/settings.json &> /dev/null | true
	@mkdir -p ~/.config/Code/User
	ln -s ${PWD}/.config/Code/User/settings.json ~/.config/Code/User/settings.json

	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension ecmel.vscode-html-css
	code --install-extension fermyon.spin-vscode
	code --install-extension github.copilot
	code --install-extension github.github-vscode-theme
	code --install-extension GitHub.remotehub
	code --install-extension GitHub.vscode-pull-request-github
	code --install-extension golang.go
	code --install-extension hashicorp.terraform
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
	code --install-extension ms-python.python
	code --install-extension ms-vscode.makefile-tools
	code --install-extension ms-vscode-remote.remote-ssh
	code --install-extension oderwat.indent-rainbow
	code --install-extension redhat.vscode-yaml
	code --install-extension rust-lang.rust-analyzer
	code --install-extension vscode-icons-team.vscode-icons
	code --install-extension HashiCorp.HCL
	code --install-extension yzhang.markdown-all-in-one

.PHONY: end
end:
	@echo "A copy of the previous dotfiles are available in the '~/.bak' folder."