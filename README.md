# dotfiles

[![Build Status](https://cloud.drone.io/api/badges/dotdc/dotfiles/status.svg)](https://cloud.drone.io/dotdc/dotfiles)

## Description

My dotfiles, mainly used on Archlinux.

## Installation

### Requirements

Install the required packages:

```console
pacman -Sy git \
           make \
           rxvt-unicode \
           tmux \
           vim
```

### Dotfiles

The following commands will:

- Copy current dotfiles in `~/.bak`.
- Delete current dotfiles (original location only).
- Create symlinks for dotfiles to the local copy of this repository.
- Install Vundle & Vim plugins

```console
git clone https://github.com/dotdc/dotfiles.git
cd dotfiles
make
```