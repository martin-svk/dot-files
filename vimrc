" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Author : Martin Toma <martin.toma.svk@gmail.com>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Date created : Tue Nov 12 14:14:56 CET 2013
" VIMRC Configuration focused on RAILS development
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ======================================================================================================================
" Bundler (Vundle) settings
" ======================================================================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------------------------------------------------------------------------------------------
" Plugin list
" ---------------------------------------------------------------------------------------------------------------------

" Let Vundle manage Vundle, REQUIRED!
Plugin 'gmarik/Vundle.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Language/Framework support plugins
" ---------------------------------------------------------------------------------------------------------------------

" -----------------------------------------------------
" Universal
" -----------------------------------------------------
" Most common languages support (ruby, js, etc.)
Plugin 'sheerun/vim-polyglot'
" Needs linters to be install to work properly (see https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers)
Plugin 'scrooloose/syntastic'
" The ulti snips engine. Makes possible to define custom snippets.
Plugin 'SirVer/ultisnips'
" ulti snips snippets for python, js, html, ruby...
Plugin 'honza/vim-snippets'

" -----------------------------------------------------
" Ruby/Rails
" -----------------------------------------------------
" Rails must have plugin
Plugin 'tpope/vim-rails'
" Automatically inserts 'end' wisely
Plugin 'tpope/vim-endwise'
" Splitting and joining multiple lines ruby constructs
Plugin 'AndrewRadev/splitjoin.vim'
" Ruby eval plugin
Plugin 'kmdsbng/vim-ruby-eval'

" -----------------------------------------------------
" HTML/CSS/JS
" -----------------------------------------------------
" HTML autoclose tags
Plugin 'amirh/HTML-AutoCloseTag'
" CSS color highlighter
Plugin 'ap/vim-css-color'
" Emmet for fast html prototyping
Plugin 'mattn/emmet-vim'

" -----------------------------------------------------
" Android
" -----------------------------------------------------
" Android build and deploy helpers
Plugin 'hsanson/vim-android'

" ---------------------------------------------------------------------------------------------------------------------
" Vim motion/navigation improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Fuzzy file, buffer, MRU finder (CTRL-P)
Plugin 'kien/ctrlp.vim'
" Easily move around file (easy motion)
Plugin 'Lokaltog/vim-easymotion'
" Sneak, easy motion for long lines
Plugin 'justinmk/vim-sneak'
" Multiple cursors feature
Plugin 'terryma/vim-multiple-cursors'

" ---------------------------------------------------------------------------------------------------------------------
" Vim interface improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plugin 'scrooloose/nerdtree'
" Airline (improved status line)
Plugin 'bling/vim-airline'
" History tree visualizer
Plugin 'sjl/gundo.vim'
" Preview before substitution (only in command line mode (c-f))
Plugin 'osyo-manga/vim-over'
" Tags (methods, classes) display window
Plugin 'majutsushi/tagbar'

" ---------------------------------------------------------------------------------------------------------------------
" Git/Github support plugins
" ---------------------------------------------------------------------------------------------------------------------

" Git wrapper
Plugin 'tpope/vim-fugitive'
" Git changes displayer
Plugin 'airblade/vim-gitgutter'
" Web api support (needed for gist-vim)
Plugin 'mattn/webapi-vim'
" Github gist plugin
Plugin 'mattn/gist-vim'

" ---------------------------------------------------------------------------------------------------------------------
" Other plugins
" ---------------------------------------------------------------------------------------------------------------------

" -----------------------------------------------------
" Text objects
" -----------------------------------------------------
" Matchit better textobj support
Plugin 'tmhedberg/matchit'
" Custom textobj creation support
Plugin 'kana/vim-textobj-user'
" Ruby block text object
Plugin 'nelstrom/vim-textobj-rubyblock'
" Expanding region selection
Plugin 'terryma/vim-expand-region'

" -----------------------------------------------------
" Other
" -----------------------------------------------------
" Supertab for tab triggering completion (integrates with snippets, etc.)
Plugin 'ervandew/supertab'
" Change surroundings characters
Plugin 'tpope/vim-surround'
" Auto-closing brackets and quotes
Plugin 'Raimondi/delimitMate'
" YANK history management
Plugin 'YankRing.vim'
" AG search from vim
Plugin 'ervandew/ag'
" Trailing spaces deleter (:FixWhitespaces)
Plugin 'bronson/vim-trailing-whitespace'
" Alignment on specific regex (:Tabularize \=)
Plugin 'godlygeek/tabular'
" Varius construct alternatives switch
Plugin 'AndrewRadev/switch.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Color-scheme plugins
" ---------------------------------------------------------------------------------------------------------------------

" Tomorrow theme
Plugin 'chriskempson/vim-tomorrow-theme'
" Molokai theme
Plugin 'tomasr/molokai'
" Rainbow parenthesis
Plugin 'kien/rainbow_parentheses.vim'
" Approximation to make gvim schemes work in terminal
Plugin 'vim-scripts/CSApprox'

" ---------------------------------------------------------------------------------------------------------------------
" End of plugin declaration
" ---------------------------------------------------------------------------------------------------------------------
call vundle#end()

" ======================================================================================================================
" Basic settings
" ======================================================================================================================

set shell=/bin/bash         " Setting vim shell to bash
set nocompatible            " No compatible with vi mode
set number                  " Just line numbers
set noignorecase            " Don't ignore cases
set laststatus=2            " Always show status line
set showmode                " Always show mode
set wildmenu                " Better auto-complete of ex commands
set textwidth=120           " Text width is 120 chars
set autoread                " Automatically reload change files on disk
set bg=dark                 " Dark background setting (dark theme version of current color)
set cursorline              " Set default cursor line (highlighting is done by color scheme)
set cmdheight=1             " Command line height
set pumheight=10            " Completion window max size
set iskeyword-=_            " Set underscore is a word separator
set timeoutlen=200          " Setting ESC timeout
set hlsearch                " Highlight search
set incsearch               " Incremental search
set hidden                  " Enables to switch between unsaved buffers and keep undo history
set undolevels=100          " How many undo commands to remember
set clipboard+=unnamed      " Use system clipboard
set history=256             " Number of things to remember in history
set nohlsearch              " Don't highlight after search
set mat=2                   " How many tenths of a second to blink when matching brackets
set lazyredraw              " Don't redraw while executing macros (better performance)
set magic                   " For regular expressions turn magic on
set showmatch               " Show matching brackets when text indicator is over them
set encoding=utf8           " Set utf8 as standard encoding and en_US as the standard language
set pastetoggle=<F3>        " Toggle between paste and nopaste
set list                    " To display chars listed in listchars below
set spelllang=en_us         " Set language to us English
set spellfile=~/.vim/dictionary.utf-8.add

" -----------------------------------------------------
" Intendation settings (2 spaces tabs)
" -----------------------------------------------------
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" -----------------------------------------------------
" Split settings (more natural).
" -----------------------------------------------------
set splitbelow
set splitright

" -----------------------------------------------------
" Turn backup off, since most stuff is in git
" -----------------------------------------------------
set nobackup
set nowb
set noswapfile

" -----------------------------------------------------
" Highlight whitespaces
" -----------------------------------------------------
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" -----------------------------------------------------
" Filetype settings
" -----------------------------------------------------
syntax on
filetype off
filetype plugin on
filetype indent on

" -----------------------------------------------------
" Folding settings, by default is disabled, use 'zi'
" -----------------------------------------------------
set foldmethod=manual
set foldlevelstart=2
set fillchars="fold: "
set nofoldenable

" -----------------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
" -----------------------------------------------------
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" make CSS omni-completion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \         setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

" -----------------------------------------------------
" Completion ignore list
" -----------------------------------------------------
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ======================================================================================================================
" Mapping settings
" ======================================================================================================================

" -----------------------------------------------------
" Setting leader
" -----------------------------------------------------
let mapleader="\<space>"
let g:mapleader="\<space>"

" -----------------------------------------------------
" Disabling arrow keys, space key, exmode enter with Q key
" -----------------------------------------------------
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <Space> <nop>
nnoremap Q <nop>

" -----------------------------------------------------
" Vim defaults tweaking and overriding
" -----------------------------------------------------

" When jump to next match also center screen
noremap n nzz
noremap N Nzz
noremap <c-d> <c-d>zz
noremap <c-u> <c-u>zz

" Write read only files with w!!
cmap w!! w !sudo tee % >/dev/null

" Easily switch between the last two files
nnoremap <leader><leader> <c-^>

" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0

" Map save to ctrl-s
nmap <silent> <c-s> :w<CR>
imap <silent> <c-s> <Esc>:w<CR>

" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]

" Easily copy and past to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Switch plugin mapping
nmap <Leader>s :Switch<CR>

" -----------------------------------------------------
" Toggles
" -----------------------------------------------------
" Toggle spelling on and off
nmap <silent> <F4> :set spell!<CR>
" Source vimrc, so new setting will be applied
nmap <silent> <F5> :source $MYVIMRC<CR>
" Open my vimrc in new tab
nmap <silent> <F6> :tabedit $MYVIMRC<CR>
" Toggle rainbow paranthesis
nmap <silent> <F12> :RainbowParenthesesToggle<CR>
" Toggle tagbar window
nmap <silent> <F2> :TagbarToggle<CR>

" -----------------------------------------------------
" Window management mappings
" -----------------------------------------------------
nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> _ :resize -5<CR>

" ======================================================================================================================
" Plugin settings
" ======================================================================================================================

" -----------------------------------------------------
" Airline settings
" -----------------------------------------------------
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0

" -----------------------------------------------------
" Nerdtree setting
" -----------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" -----------------------------------------------------
" CTRL-P settings
" -----------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_cmd = 'CtrlPMixed'

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" -----------------------------------------------------
" Ultisnips settings
" -----------------------------------------------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-n>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" -----------------------------------------------------
" Supertab settings TODO: Think about c-p
" -----------------------------------------------------
let g:SuperTabDefaultCompletionType = '<c-p>'

" -----------------------------------------------------
" Syntastic settings
" -----------------------------------------------------
let g:syntastic_ruby_checkers = ['mri']
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" show the error list automatically
let g:syntastic_auto_loc_list=1
" check on open as well as save
let g:syntastic_check_on_open=1
" don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
" Passive mode is default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Disable csslint, scss and sass is not behaving correctly
let g:loaded_syntastic_css_csslint_checker = 0

" -----------------------------------------------------
" Gundo settings
" -----------------------------------------------------
let g:gundo_right = 1
let g:gundo_preview_height = 30

" -----------------------------------------------------
" Easy motion settings
" -----------------------------------------------------
let g:EasyMotion_keys='asdfjkoweriop'

" -----------------------------------------------------
" Tagbar settings
" -----------------------------------------------------
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" ======================================================================================================================
" Plugin mapping and other settings
" ======================================================================================================================

" Toggle nerdtree panel
nnoremap <silent> <F1> :NERDTreeToggle<CR>

" Toggle gundo panel
nnoremap <silent> <F7> :GundoToggle<CR>

" Toggle syntax checking
nnoremap <F8> :SyntasticToggleMode<CR>

" CTRL-P mapping
let g:ctrlp_map = '<Leader>p'
nnoremap <silent> <Leader>t :CtrlPBufTagAll<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Easy motion mapping
let g:EasyMotion_leader_key = 'm'

" Tabs and buffs switching and closing mapping
nnoremap td :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tb :tabprevious<CR>
nnoremap ,d :bd<CR>
nnoremap ,n :bn<CR>
nnoremap ,b :bp<CR>

" Yankring mapping
map <Leader>y :YRShow<CR>

" Surround vim shortcut for quotes toggle
nmap cq cs"'
nmap cQ cs'"

" Expand region mappings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Split/Join plugin mappings
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>

" Ruby eval mapping
nnoremap <silent> <Leader>e :RubyEval<CR>

" ======================================================================================================================
" Color and highlighting settings
" ======================================================================================================================

" Xterm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" Color scheme settings
colorscheme Tomorrow-Night
" Airline theme
let g:airline_theme='tomorrow'
" Molokai settings (used in android devel)
let g:molokai_original = 1

" Git gutter settings (signcolumn color)
highlight clear SignColumn
" Remove underline in folded lines
hi Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" ======================================================================================================================
" Filetype specific settings
" ======================================================================================================================

" If java(android) set appropriate indentation and color scheme
autocmd FileType java set shiftwidth=4| set softtabstop=4

" ======================================================================================================================
" Autocommands and other tweaks
" ======================================================================================================================

" Close vim if the last open window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" ======================================================================================================================
" Setting abbreviations to automatically repair mistakes
" ======================================================================================================================

" Command abbreviations to accept case errors
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" Text abbreviations
ab teh the

" ======================================================================================================================
" END OF VIMRC
" ======================================================================================================================

" ======================================================================================================================
" :HELP .VIMRC
" ======================================================================================================================
"
" Section 1. - The basics
" =======================
"
" Section 1.y - Toggles (on/off)
" ------------------------------
"
" F1 - Nerdtree (file browser)
" F2 - Tagbar (tag browser)
" F3 - Paste mode
" F4 - Spell checking
" F5 - Reload vimrc
" F6 - Open vimrc in new tab
" F7 - Gundo (undo tree)
" F8 - Syntax checking
" F9 -
" F10 -
" F11 -
" F12 - Rainbow paranthesis
"
" # Section 2. - File navigation
" ==============================
"
"
" # Section 3. - Navigation in code
" =================================
"
"
" # Section 4. - Code manipulation
" ================================
"
" 3.3 Multiple cursors:
"
" Using default keybindings:
"   let g:multi_cursor_next_key='<C-n>'
"   let g:multi_cursor_prev_key='<C-p>'
"   let g:multi_cursor_skip_key='<C-x>'
"   let g:multi_cursor_quit_key='<Esc>'
"
" # Section 5. - Look and feel
" ============================
"
"
" # Section 6. - Other tweaks
" ===========================
"
"
" ======================================================================================================================
" END OF :HELP .VIMRC
" ======================================================================================================================

" ======================================================================================================================
" TODO: SECTION
" ======================================================================================================================
"
" 1. Really start writing this vimrc help file.
" 2. Start using this week focused on block to learn advanced things step by step.
" 3. Fill abbreviations list and dictionary items.
" 4. Set up manual folds in here.
" 5. Create my own colorscheme based on itf.flat from sublime text.
"
" ======================================================================================================================
