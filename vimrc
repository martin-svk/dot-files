" Author : Martin Toma
" Date created : Tue Nov 12 14:14:56 CET 2013
" vimrc config file for RAILS development

" Basic settings
set shell=bash\ --norc  " Setting vim shell to bash (using fish)
set nocompatible        " No compatible with vi mode
filetype plugin on      " Specific intendation and more by filetype
set number              " Line numbers
syntax on               " Syntax coloring

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Intedation settings
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Color settings
colorscheme slate
