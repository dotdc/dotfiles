# dotfiles

[![Build Status](https://cloud.drone.io/api/badges/imrtfm/dotfiles/status.svg)](https://cloud.drone.io/imrtfm/dotfiles)

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