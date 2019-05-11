# dotfiles

[![Travis CI](https://travis-ci.org/imrtfm/dotfiles.svg?branch=master)](https://travis-ci.org/imrtfm/dotfiles)

## Description

My Arch Linux dotfiles.

## Installation

### Requirements

To install the required packages:

```console
pacman -Sy git \
           rxvt-unicode \
           tmux \
           vim
```

### Dotfiles

The dotfiles installation will:

- Make a copy of your current dotfiles in the ~/.bak folder.
- Delete the previously copied dotfiles.
- Create symlinks from this repo to your home folder.

```console
git clone https://github.com/imrtfm/dotfiles.git
cd dotfiles
make
```