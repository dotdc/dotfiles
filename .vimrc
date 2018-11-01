" General
syntax on
filetype off
colorscheme molokai
highlight Normal ctermbg=NONE
set nocompatible

" Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'pearofducks/ansible-vim'
Plugin 'fatih/vim-hclfmt'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

" Configuration
set showcmd         " Show (partial) command in status line.
set cursorline      " Highlight the current line
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
set history=10     " how many ex commands, search strings and expressions are remembered.

" Vim Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

" Mapping
" nmap = Normal Mode Mapping
" imap = Insert Mode Mapping
" vmap = Visual Mode Mapping
" Available keys to map: g K q V v ^A ^K ^O ^W ^X _ * \ = F1 F2 ...
" Special keys usage: <F1> <Enter> <Space> <Esc> <PageUp> <PageDown> ...
imap <c-x> <Enter>################################################################################<Enter>

" Reopen file at last know position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
