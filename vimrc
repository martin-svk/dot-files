" ======================================================================================================================
" Author : Martin Toma
" ======================================================================================================================
" Date created : Tue Nov 12 14:14:56 CET 2013
" VIMRC Config focused on RAILS development
" ======================================================================================================================
" ======================================================================================================================

" :help this_vimrc.txt
" ======================================================================================================================
"
" # Section 1. - The basics
"
"
"
" # Section 2. - File navigation
"
"
"
" # Section 3. - Navigation in code
"
"
"
" # Section 4. - Code manipulation
"
"
"
" # Section 5. - Look and feel
"
"
"
" # Section 6. - Other tweaks
"
"
" ======================================================================================================================

" ======================================================================================================================
" Bundler setting
" ======================================================================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------------------------------------------------------------------------------------------
" Plugin list
" ---------------------------------------------------------------------------------------------------------------------

" Let Vundle manage Vundle, REQUIRED!
Plugin 'gmarik/Vundle.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Language/Framework support improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Rails vim plugin
Plugin 'tpope/vim-rails'
" Basic ruby related features
Plugin 'vim-ruby/vim-ruby'
" Slim templating syntax highliting
Plugin 'slim-template/vim-slim.git'
" Better JSON syntax
Plugin 'elzr/vim-json'
" Automatically inserts 'end' wisely
Plugin 'tpope/vim-endwise'
" HAML support for vim
Plugin 'tpope/vim-haml'
" Coffescript support for vim
Plugin 'kchmck/vim-coffee-script'
" Better javascript support
Plugin 'jelera/vim-javascript-syntax'
" CSS color highlighter
Plugin 'ap/vim-css-color'

" Needs linters to be install to work properly (see https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers)
" Syntax checking plugin
Plugin 'scrooloose/syntastic'

" The ulti snips engine. Makes possible to define custom snippets.
Plugin 'SirVer/ultisnips'
" Snippets for python, js, html, ruby...
Plugin 'honza/vim-snippets'
" Emmet for fast html prototyping
Plugin 'mattn/emmet-vim'

" ---------------------------------------------------------------------------------------------------------------------
" Vim motion/navigation improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Fuzzy file, buffer, MRU finder (CTRL-P)
Plugin 'kien/ctrlp.vim'
" Easily move around file (easy motion)
Plugin 'Lokaltog/vim-easymotion'
" Multiple cursors vim support
Plugin 'terryma/vim-multiple-cursors'
" Seek, easy motion for long lines
Plugin 'goldfeld/vim-seek'

" ---------------------------------------------------------------------------------------------------------------------
" Vim interface improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plugin 'scrooloose/nerdtree'
" Airline (improved statusline)
Plugin 'bling/vim-airline'

" ---------------------------------------------------------------------------------------------------------------------
" Git/Github support plugins
" ---------------------------------------------------------------------------------------------------------------------

" Git wrapper
Plugin 'tpope/vim-fugitive'
" Git changes displayer
Plugin 'airblade/vim-gitgutter'
" Github gist plugin
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" ---------------------------------------------------------------------------------------------------------------------
" Other plugins
" ---------------------------------------------------------------------------------------------------------------------

" Change surroundings characters
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
" Trailing spaces deleter (:FixWhitespaces)
" Supertab for tab triggering completion (integrates with snippets, etc.)
Plugin 'ervandew/supertab'
" Autoclosing brackets and quotes
Plugin 'Raimondi/delimitMate'
" YANK history management
Plugin 'maxbrunsfeld/vim-yankstack'
" AG search from vim
" Matchit better textobj support
Plugin 'ervandew/ag'
Plugin 'tmhedberg/matchit'
" Custom textobj creation support
Plugin 'kana/vim-textobj-user'
" Ruby block text object
Plugin 'nelstrom/vim-textobj-rubyblock'
" Unix utilities helper (SudoWrite)
Plugin 'tpope/vim-eunuch'
" Alignment on specific regex (:Tabularize \=)
Plugin 'godlygeek/tabular'

" ---------------------------------------------------------------------------------------------------------------------
" Colorscheme plugins
" ---------------------------------------------------------------------------------------------------------------------

" Hybrid light and dark color schemes
Plugin 'w0ng/vim-hybrid'
" Tommorow color schemes
Plugin 'chriskempson/vim-tomorrow-theme'
" Molokai theme
Plugin 'tomasr/molokai'
" Jellybeans theme
Plugin 'nanotech/jellybeans.vim'

" ---------------------------------------------------------------------------------------------------------------------
" End of plugin declaration
" ---------------------------------------------------------------------------------------------------------------------
call vundle#end()

" ======================================================================================================================
" Basic settings
" ======================================================================================================================

set shell=/bin/bash     " Setting vim shell to bash
set nocompatible        " No compatible with vi mode
set number              " Line numbers
set noignorecase        " Don't ignore cases
set laststatus=2        " Always show status line
set showmode            " Always show mode
set wildmenu            " Better auto-complete of ex commands
set textwidth=120        " Text with is 80 chars
set autoread            " Automatically reload change files on disk
set bg=dark             " Dark background setting (dark theme version of current color)
set cursorline          " Set default cursor line (highlighting is done by color scheme)
set cmdheight=1         " Command line height
set pumheight=10        " Completion window max size
set iskeyword-=_        " Set underscore is a word separator
set timeoutlen=200      " Setting ESC timeout
set hlsearch            " Highlight search
set incsearch           " Incremental search
set hidden              " Enables to switch between unsaved buffers and keep undo history
set foldenable          " Enable code folding
set clipboard+=unnamed  " Use system clipboard
set history=256         " Number of things to remember in history
set nohlsearch          " Don't highlight after search

" Intedation settings (2 spaces tabs)
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
syntax on
filetype off
filetype plugin on
filetype indent on

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disabling space key
map <Space> <nop>

" Disabling Q to access ex mode
nnoremap Q <nop>

" ---------------------------------------------------------------------------------------------------------------------
" Color settings
" ---------------------------------------------------------------------------------------------------------------------

" Xterm 256 colors
if $TERM == 'xterm-256color'
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" Tmux/screen 256 colors support
if $TERM == 'screen-256color'
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" ---------------------------------------------------------------------------------------------------------------------
" Color scheme time based settings
" ---------------------------------------------------------------------------------------------------------------------

" Before 16 hour
if strftime('%H') < 16
  let g:molokai_original = 1
  let g:rehash256 = 1
  colorscheme molokai
else
  colorscheme hybrid
endif

let g:airline_theme='powerlineish'
set bg=dark

" ======================================================================================================================
" Plugin settings
" ======================================================================================================================

" Airline settings
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0

" CTRL-P settings
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

" Ultisnips settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-n>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
" Setting ruby autocomple
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" Supertab settings
let g:SuperTabDefaultCompletionType = '<c-n>'

" Git gutter settings (signcolumn color)
highlight clear SignColumn

" Syntastic settings
let g:syntastic_ruby_checkers = ['mri']

" ======================================================================================================================
" Mapping settings
" ======================================================================================================================

" Setting leader
let mapleader="\<space>"

" Window resizing keys
nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> _ :resize -5<CR>

" Map save to ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Creating bubbling like feature
nmap <C-k> ddkP
nmap <C-j> ddp

" ---------------------------------------------------------------------------------------------------------------------
" Specific for each plugin
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree mappings
map <Leader>f :NERDTreeToggle<CR>

" CTRL-P mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
" No need for tagbar now
map <c-t> :CtrlPBufTagAll<CR>

" Easy motion mapping
let g:EasyMotion_leader_key = 'm'

" Buffer switching mapping g[q]uit, g[b]ack, g[n]ext
map gb :bp<CR>
map gn :bn<CR>
map gq :bd<CR>

" Rails vim plugin mapping
map gc :Rcontroller<CR>
map gv :Rview<CR>
" for goto model use gf (go file)
map ga :A<CR>
map gr :R<CR>

" Yankstack mapping
" To avoid loading default map keys
let g:yankstack_map_keys = 0
" YANK register mapping go [p]aste
nmap gp <Plug>yankstack_substitute_older_paste
nmap gP <Plug>yankstack_substitute_newer_paste

" Multiple cursors mapping (c-p and c-x is for visual mode)
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Surround vim shortcut for quotes toggle
nmap cq cs"'
nmap cQ cs'"

" ======================================================================================================================
" END OF VIMRC
" ======================================================================================================================
