" Author : Martin Toma
" Date created : Tue Nov 12 14:14:56 CET 2013
" vimrc config file for RAILS development

" Basic settings ==============================================================

set shell=bash\ --norc  " Setting vim shell to bash (using fish)
set nocompatible        " No compatible with vi mode
set number              " Line numbers
set ch=2                " Make command line two lines high
set noignorecase        " Dont ignore cases
set laststatus=2        " Always show status line
set showmode            " Akways show mode
set wildmenu            " Better auto-complete of ex commands
set textwidth=80        " Text with is 80 chars
set autoread            " Automatically reload change files on disk

" Filetype settings
syntax on               " Syntax coloring
filetype on             " Filetype detection on
filetype plugin on      " Specific plugins by filetype
filetype indent on      " Specific intendation

" Search settings
set hlsearch            " Highlight search
set incsearch           " Incremental search

" Buffer settings
set autowrite           " Automatic saving

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Intedation settings (2 spaces tabs)
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Color settings
colorscheme slate

" Mapping settings ============================================================
