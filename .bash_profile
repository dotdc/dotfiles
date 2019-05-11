#!/bin/bash
# Source ~/.bashrc if it's a file or a symlink
# shellcheck disable=SC1090
[[ -f ~/.bashrc || -L ~/.bashrc ]] && . ~/.bashrc
