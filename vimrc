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
" Airline (improved statusline)
Bundle 'bling/vim-airline'

" Basic settings
" ======================================================================================================================

set shell=bash\ --norc  " Setting vim shell to bash (using fish)
set nocompatible        " No compatible with vi mode
set number              " Line numbers
set noignorecase        " Dont ignore cases
set laststatus=2        " Always show status line
set showmode            " Akways show mode
set wildmenu            " Better auto-complete of ex commands
set textwidth=80        " Text with is 80 chars
set autoread            " Automatically reload change files on disk
set bg=dark             " Dark background setting (dark theme version of current color)
set cursorline          " Set default cursor line (highlighting is done by color scheme)
set cmdheight=2         " Command line height

" Filetype settings
syntax on               " Syntax coloring
filetype off            " Required by Bundler
filetype plugin on      " Specific plugins by filetype
filetype indent on      " Specific intendation

" Search settings
set hlsearch            " Highlight search
set incsearch           " Incremental search

" Buffer settings
set hidden              " Enables to switch between unsaved buffers and keep undo history

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

" Xterm 256 colors
if $TERM == "xterm-256color"
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" Tmux/screen 256 colors support
if $TERM == "screen-256color"
set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif


" Mapping settings
" ======================================================================================================================

" Let commands (setting keys)
let mapleader=" "             " map leader to space

" Specific for each plugin

" Nerdtree mappings
map <C-n> :NERDTreeToggle<CR>

" Color scheme setting (must be last)
colorscheme herald
