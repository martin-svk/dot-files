" Author : Martin Toma
" Date created : Tue Nov 12 14:14:56 CET 2013
" vimrc config file for RAILS development

" Bundler setting

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" PLugins bundles

" Vundle itself
Bundle 'gmarik/vundle'
" Nerdtree file browser
Bundle 'scrooloose/nerdtree'


" Basic settings ===============================================================

set shell=bash\ --norc  " Setting vim shell to bash (using fish)
set nocompatible        " No compatible with vi mode
set number              " Line numbers
set noignorecase        " Dont ignore cases
set laststatus=2        " Always show status line
set showmode            " Akways show mode
set wildmenu            " Better auto-complete of ex commands
set textwidth=80        " Text with is 80 chars
set autoread            " Automatically reload change files on disk
set bg=light             " Dark background setting (dark theme version of current color)

" Filetype settings
syntax on               " Syntax coloring
filetype off            " Required by Bundler
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

if $TERM == "xterm-256color"
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" Mapping settings =============================================================
" Specific for each plugin

" Nerdtree mappings
map <C-n> :NERDTreeToggle<CR>

" Toogle background function
map <F5> :call ToggleBg()<CR>

function! ToggleBg()
  if &background == 'dark'
    set bg=light
  else
    set bg=dark
  endif
endfunc

" Color scheme setting
colorscheme herald
