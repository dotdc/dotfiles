""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype on
colorscheme molokai
highlight Normal ctermbg=NONE

set ruler
set showcmd
set autoread
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set history=50

" Filetype specific configuration
filetype plugin indent on
autocmd Filetype json setlocal sts=2 sw=2
autocmd Filetype ruby setlocal sts=2 sw=2
autocmd Filetype yaml setlocal sts=2 sw=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'pearofducks/ansible-vim'
Plugin 'fatih/vim-hclfmt'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'stephpy/vim-yaml'
Plugin 'cespare/vim-toml'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-packer'
Plugin 'rust-lang/rust.vim'
call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nmap, imap or vmap (Mapping for Normal, Insert or Visual mode)
" Available keys to map: g K q V v ^A ^K ^O ^W ^X _ * \ = F1 F2 ...
" Special keys usage: <F1> <Enter> <Space> <Esc> <PageUp> <PageDown> ...

nmap <c-x> 80a#<Esc>a<Enter><Esc>
imap <c-x> <Esc>80a#<Esc>a<Enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
