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

Several installation options:

| Command         | Description                                           |
|-----------------|-------------------------------------------------------|
| `make dotfiles` | Backup current dotfiles in `~/.bak` & install theses  |
| `make vim`      | Configure Vim and install Vundle & Vim plugins        |
| `make vscode`   | Configure vscode & install extensions                 |
| `make all`      | Make all the above                                    |

## Example usage

```console
git clone https://github.com/dotdc/dotfiles.git
cd dotfiles
make dotfiles
```
