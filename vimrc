" Author : Martin Toma
" Date created : Tue Nov 12 14:14:56 CET 2013
" vimrc config file for RAILS development

" Bundler setting

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins bundles

" Vundle itself
Bundle 'gmarik/vundle'
" Nerdtree file browser
Bundle 'scrooloose/nerdtree'
" Make nerdtree as stable left tab
Bundle 'jistr/vim-nerdtree-tabs'
" Airline (improved statusline)
Bundle 'bling/vim-airline'
" Commentary support
Bundle 'scrooloose/nerdcommenter'
" Fuzzy file, buffer, MRU finder (CTRL-P)
Bundle 'kien/ctrlp.vim'
" Syntax checking plugin (syntastic)
Bundle 'scrooloose/syntastic'
" Easily move around file (easy motion)
Bundle 'Lokaltog/vim-easymotion'
" Rails vim plugin
Bundle 'tpope/vim-rails'
" Slim templating syntax highliting
Bundle 'slim-template/vim-slim.git'
" Buffer explorer and easier navigation
Bundle 'jlanzarotta/bufexplorer'
" Basic ruby related features
Bundle 'vim-ruby/vim-ruby'
" The ulti snips engine.
Bundle 'SirVer/ultisnips'
" Snippets for python, js, html, ruby...
Bundle 'honza/vim-snippets'
" Tagbar for displaying exuberant ctags
Bundle 'majutsushi/tagbar'
" Relative line numbers
Bundle 'myusuf3/numbers.vim'
" Change surroundings
Bundle 'tpope/vim-surround'
" Multiple cursors vim support
Bundle 'terryma/vim-multiple-cursors'
" Trailing spaces deleter and highlighter
Bundle 'bronson/vim-trailing-whitespace'
" Supertab for tab triggering completion
Bundle 'ervandew/supertab'


" Basic settings
" ======================================================================================================================

set shell=bash\ --norc  " Setting vim shell to bash (using fish)
set nocompatible        " No compatible with vi mode
set number              " Line numbers
set noignorecase        " Don't ignore cases
set laststatus=2        " Always show status line
set showmode            " Always show mode
set wildmenu            " Better auto-complete of ex commands
set textwidth=80        " Text with is 80 chars
set autoread            " Automatically reload change files on disk
set bg=dark             " Dark background setting (dark theme version of current color)
set cursorline          " Set default cursor line (highlighting is done by color scheme)
set cmdheight=1         " Command line height
set previewheight=10    " Completion window max size

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

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Setting ruby autocomple
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" Supertab settings
let g:SuperTabDefaultCompletionType = "<c-n>"

" Mapping settings
" ======================================================================================================================

" Setting leader
let mapleader="\<space>"                                " map leader to space

" Mappings for default vim commands to keys
map <Leader>h :nohl<CR>                                 " map space+h to switch off search results [h]ighlight

" Window resizing keys
map <Leader>= :vertical resize +5<CR>
map <Leader>- :vertical resize -5<CR>

" Spellcheck toggle mapping
nmap <silent> <Leader>s :set spell!<CR>

" Specific for each plugin
" ======================================================================================================================

" Nerdtree mappings
map <Leader>f :NERDTreeTabsToggle<CR>                   " Show the [f]iles window

" Tagbar mapping
map <Leader>t :TagbarToggle<CR>                         " Show the [t]agbar window

" CTRL-P mapping
let g:ctrlp_map = '<c-p>'                               " Control and P like in sublime
let g:ctrlp_cmd = 'CtrlP'

" Easy motion mapping
let g:EasyMotion_leader_key = 'm'                       " Trigger easy [m]otions by

" Buffer switching mapping
map <Leader>j :bp<CR>
map <Leader>k :bn<CR>

" Rails vim plugin mapping
map <Leader>c :Rcontroller<CR>
map <Leader>v :Rview<CR>
map <Leader>m :Rmodel<CR>

" Color scheme setting (must be last)
colorscheme tomorrow-night
