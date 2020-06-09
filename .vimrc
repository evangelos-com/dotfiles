set nocp

set backspace=2

set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch

syntax on

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

colorscheme dracula
