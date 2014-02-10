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
" Commentary support
Bundle 'tpope/vim-commentary'
" Fuzzy file, buffer, MRU finder (CTRL-P)
Bundle 'kien/ctrlp.vim'
" Syntax checking plugin (syntastic)
Bundle 'scrooloose/syntastic'
" Easily move around file (easy motion)
Bundle 'Lokaltog/vim-easymotion'
" Rails vim plugin
Bundle 'tpope/vim-rails'

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
set cmdheight=1         " Command line height

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
" Disabling space key
map <Space> <nop>

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

" Plugin settings
" ======================================================================================================================

" Airline settings
let g:airline#extensions#tabline#enabled=1              " enabled nice tabs support
let g:airline#extensions#tabline#left_sep = ' '         " separators setting
let g:airline#extensions#tabline#left_alt_sep = '|'     " alternative separator

" CTRL-P settings
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'

" Mapping settings
" ======================================================================================================================

" Let commands (setting keys)
let mapleader=" "                                       " map leader to space

" Specific for each plugin

" Nerdtree mappings
map <Leader>f :NERDTreeToggle<CR>                       " Leader - [f]iles

" CTRL-P mapping
let g:ctrlp_map = '<c-p>'                               " Control and P like in sublime
let g:ctrlp_cmd = 'CtrlP'

" Easy motion mapping
let g:EasyMotion_leader_key = 'm'                       " Trigger easy motions by [m]otion

" Color scheme setting (must be last)
colorscheme tomorrow-night
