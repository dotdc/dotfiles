# Makefile

SHELL := /bin/bash

.PHONY: install
install: init bash fonts tmux vim xorg end

.PHONY: init
init:
	@mkdir -p ~/.bak
	@echo "Created ~/.bak folder"

.PHONY: bash
bash:
	# ~/.bashrc
	@cp ~/.bashrc ~/.bak/ &> /dev/null | true
	@rm ~/.bashrc &> /dev/null | true
	ln -s ${PWD}/.bashrc ~/.bashrc
	# ~/.bash_profile
	@cp ~/.bash_profile ~/.bak/ &> /dev/null | true
	@rm ~/.bash_profile &> /dev/null | true
	ln -s ${PWD}/.bash_profile ~/.bash_profile

.PHONY: fonts
fonts:
	# ~/.fonts
	@cp -r ~/.fonts ~/.bak/ &> /dev/null | true
	@rm -r ~/.fonts &> /dev/null | true
	ln -s ${PWD}/.fonts ~/.fonts

.PHONY: tmux
tmux:
	# ~/.tmux.conf
	@cp ~/.tmux.conf ~/.bak/ &> /dev/null | true
	@rm ~/.tmux.conf &> /dev/null | true
	ln -s ${PWD}/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim:
	# ~/.vimrc
	@cp ~/.vimrc ~/.bak/ &> /dev/null | true
	@rm ~/.vimrc &> /dev/null | true
	ln -s ${PWD}/.vimrc ~/.vimrc
	# ~/.vim/colors
	@cp -r ~/.vim/colors ~/.bak/ &> /dev/null | true
	@rm -r ~/.vim/colors &> /dev/null | true
	@mkdir -p ~/.vim
	ln -s ${PWD}/.vim/colors ~/.vim/colors
	# Vundle & Plugins
	@rm -rf ~/.vim/bundle/Vundle.vim | true
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

.PHONY: xorg
xorg:
	# ~/.Xdefaults
	@cp ~/.Xdefaults ~/.bak/ &> /dev/null | true
	@rm ~/.Xdefaults &> /dev/null | true
	ln -s ${PWD}/.Xdefaults ~/.Xdefaults
	# ~/.Xressources
	@cp ~/.Xressources ~/.bak/ &> /dev/null | true
	@rm ~/.Xressources &> /dev/null | true
	ln -s ${PWD}/.Xressources ~/.Xressources

.PHONY: end
end:
	@echo "A copy of the previous dotfiles are available in the '~/.bak' folder."