# dotfiles

[![Build Status](https://cloud.drone.io/api/badges/dotdc/dotfiles/status.svg)](https://cloud.drone.io/dotdc/dotfiles)

## Description

My dotfiles, mainly used on Arch Linux.

## Requirements

Install the required packages, for Arch Linux:

```console
pacman -Sy git \
           make \
           rxvt-unicode \
           tmux \
           vim
```

## Installation

The `make` command will:

- Copy current dotfiles in `~/.bak`.
- Delete current dotfiles (original location only).
- Create symlinks based on the location of this repository.
- Install Vundle & Vim plugins

```console
git clone https://github.com/dotdc/dotfiles.git
cd dotfiles
make
```