" ======================================================================================================================
" Author : Martin Toma
" Date created : Tue Nov 12 14:14:56 CET 2013
" vimrc config file for RAILS development
" ======================================================================================================================

" Bundler setting
" ======================================================================================================================

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins bundles
" ======================================================================================================================

" Vundle itself
Bundle 'gmarik/vundle'
" Nerdtree file browser
Bundle 'scrooloose/nerdtree'
" Treat Nerdtree as solid tab
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
" Basic ruby related features
Bundle 'vim-ruby/vim-ruby'
" The ulti snips engine.
Bundle 'SirVer/ultisnips'
" Snippets for python, js, html, ruby...
Bundle 'honza/vim-snippets'
" Tagbar for displaying exuberant ctags
Bundle 'majutsushi/tagbar'
" Change surroundings
Bundle 'tpope/vim-surround'
" Multiple cursors vim support
Bundle 'terryma/vim-multiple-cursors'
" Trailing spaces deleter and highlighter
Bundle 'bronson/vim-trailing-whitespace'
" Supertab for tab triggering completion
Bundle 'ervandew/supertab'
" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'
" Git changes displayer
Bundle 'airblade/vim-gitgutter'
" Better JSON syntax
Bundle 'elzr/vim-json'
" Autoclosing brackets and quotes
Bundle 'Townk/vim-autoclose'
" YANK history management
Bundle 'maxbrunsfeld/vim-yankstack'
" AG search from vim
Bundle 'ervandew/ag'
" Graphical undo tree
Bundle 'sjl/gundo.vim'
" Window handler and autoresizer
Bundle 'zhaocai/GoldenView.Vim'

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
set pumheight=10        " Completion window max size
set iskeyword-=_        " Set underscore is a word separator
set timeoutlen=200      " Setting timeout to just half a second
set hlsearch            " Highlight search
set incsearch           " Incremental search
set hidden              " Enables to switch between unsaved buffers and keep undo history
set foldenable          " Enable code folding
set relativenumber      " Relative numbering

" Intedation settings (2 spaces tabs)
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" Filetype settings
syntax on               " Syntax coloring
filetype off            " Required by Bundler
filetype plugin on      " Specific plugins by filetype
filetype indent on      " Specific intendation

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disabling space key
map <Space> <nop>

" Color settings
" ======================================================================================================================

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

" scheme
colorscheme jellybeans

" Plugin settings
" ======================================================================================================================

" Airline settings
let g:airline#extensions#tabline#enabled=1              " enabled nice tabs support
let g:airline#extensions#tabline#left_sep = ' '         " separators setting
let g:airline#extensions#tabline#left_alt_sep = '>'     " alternative separator
let g:airline_powerline_fonts = 0                       " powerline font symbols

" CTRL-P settings
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Setting ruby autocomple
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" Supertab settings
let g:SuperTabDefaultCompletionType = "<c-n>"

" Solarized cscheme 256 settings
let g:solarized_termcolors=256

" Git gutter settings (signcolumn color)
highlight clear SignColumn

" Goldenview setting
let g:goldenview__enable_default_mapping = 0

" ======================================================================================================================
" Mapping settings
" ======================================================================================================================

" Setting leader
let mapleader="\<space>"                                " map leader to space

" Mappings for default vim commands to keys
map <Leader>h :nohl<CR>                                 " map space+h to switch off search results [h]ighlight

" Window resizing keys
nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> _ :resize -5<CR>

" Spellcheck toggle mapping, leader s using as split window
" nmap <silent> <Leader>s :set spell!<CR>

" Map save to ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Creating bubbling like feature
nmap <C-k> ddkP
nmap <C-j> ddp

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
map gj :bp<CR>                                          " [g]o j or k in open tabs
map gk :bn<CR>

" Rails vim plugin mapping
map gc :Rcontroller<CR>                                 " [g]o [c]ontroller, etc
map gv :Rview<CR>
map gm :Rmodel<CR>

" CtrlP mapping (revision)
map <c-l> :CtrlPBuffer<CR>

" YANK register mapping - needs revision
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Gundo tree mapping
nnoremap <Leader>u :GundoToggle<CR>

" Goldenview mappings
nmap <silent> <Leader>s <Plug>GoldenViewSplit
nmap <silent> <Leader>m <Plug>GoldenViewSwitchMain
