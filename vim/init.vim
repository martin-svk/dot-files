" ######################################################################################################################
" ### Author : Martin Toma <martin.toma.svk@gmail.com>                                                               ###
" ######################################################################################################################
" ### Neovim Configuration focused on Web development                                                                ###
" ### Date created : Tue Oct 14 19:58:11 CET 2014                                                                    ###
" ### Vimmer since : Tue Nov 12 14:14:56 CET 2013                                                                    ###
" ######################################################################################################################

" ======================================================================================================================
" 1.0 Plugin manager (Plug) settings
" ======================================================================================================================
"{{{

call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.1 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins
" ---------------------------------------------------------------------------------------------------------------------

" Most common languages file types (syntax, indenting, etc.)
Plug 'sheerun/vim-polyglot'
" Asynchronous maker and linter (Asynchronous runner, needs linters to work properly)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Automatically closing stuff
Plug 'cohama/lexima.vim'
" Snippets support
Plug 'SirVer/ultisnips'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Multi-language testing support (uses NeoTerm)
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] }

" -----------------------------------------------------
" Ruby/Rails
" -----------------------------------------------------

" (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" String interpolation helper
Plug 'p0deje/vim-ruby-interpolation', { 'for': ['ruby'] }
" Refactoring tools
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }

" -----------------------------------------------------
" HTML/CSS/JS
" -----------------------------------------------------

" JS libs syntax files, ember, angular, etc.
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'coffee'] }
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
" Sparkup, emmet alternative (<C-e> to expand expression)
Plug 'rstacruz/sparkup', { 'for': ['html', 'xhtml', 'eruby'] }
" CSS color highlighter
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Unite (Files, Buffers, Commands, etc. fuzzy searcher)
Plug 'Shougo/unite.vim'
" Unite tags source
Plug 'Shougo/unite-outline'
" Unite history/yank source
Plug 'Shougo/neoyank.vim'
" Unite MRU source
Plug 'Shougo/neomru.vim'
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Highlight long lines
Plug 'whatyouhide/vim-lengthmatters'
" Shows current search match / total matches
Plug 'henrik/vim-indexed-search', { 'on':  'ShowSearchIndex' }
" Neovim terminal improving
Plug 'kassio/neoterm', { 'on': 'T' }

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins
" ---------------------------------------------------------------------------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
" Git log viewer
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" Color picker
Plug 'KabbAmine/vCoolor.vim', { 'on': 'VCoolor' }

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation
" ---------------------------------------------------------------------------------------------------------------------

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Software capslock (gC in normal mode, <C-G>c in insert mode)
Plug 'tpope/vim-capslock'
" Additional text objects
Plug 'wellle/targets.vim'
" Clever F, T
Plug 'rhysd/clever-f.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes
" ---------------------------------------------------------------------------------------------------------------------

" Hybrid
Plug 'w0ng/vim-hybrid'
" Molokai
Plug 'tomasr/molokai'
" Badfox
Plug 'viccuad/badfox'

" ---------------------------------------------------------------------------------------------------------------------
" Other
" ---------------------------------------------------------------------------------------------------------------------

" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" Hacker typing
Plug 'natw/keyboard_cat.vim', { 'on':  'PlayMeOff' }
" Man reading in vim
Plug 'jez/vim-superman'

" ---------------------------------------------------------------------------------------------------------------------
" Dependencies
" ---------------------------------------------------------------------------------------------------------------------

" Async processing (for Unite)
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Matchit enhances motions
Plug 'edsono/vim-matchit'
" More . repeat functionality
Plug 'tpope/vim-repeat'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings
" ======================================================================================================================
"{{{

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set laststatus=2                            " Always show status line
set showmode                                " Always show mode
set wildmenu                                " Better auto-complete of ex commands
set textwidth=120                           " Text width is 120 chars
set autoread                                " Automatically reload change files on disk
set nocursorline                            " Don't set default cursor line
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set iskeyword-=_                            " Set underscore as a word separator
set iskeyword-=-                            " Set dash as a word separator
set timeoutlen=300                          " Setting ESC timeout
set incsearch                               " Incremental search
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set undolevels=100                          " How many undo commands to remember
set clipboard+=unnamed                      " Use system clipboard
set history=1024                            " Number of things to remember in history
set nohlsearch                              " Don't highlight after search
set mat=2                                   " How many tenths of a second to blink when matching brackets
set lazyredraw                              " Don't redraw while executing macros (better performance)
set magic                                   " For regular expressions turn magic on
set showmatch                               " Show matching brackets when text indicator is over them
set list                                    " Display white chars by default (use <F7>)
set spelllang=en_us                         " Set language to us English
set backspace=indent,eol,start              " Set default behavior of backspace
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set startofline                             " When doing thing like gg or G, will move cursor to start of line
set wrapscan                                " Search again from top when reached the bottom
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set mouse=                                  " Disable mouse integration

" -----------------------------------------------------
" 2.1 Indentation settings (2 spaces tabs)
" -----------------------------------------------------
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" -----------------------------------------------------
" 2.2 Split settings (more natural).
" -----------------------------------------------------
set splitbelow
set splitright

" -----------------------------------------------------
" 2.3 Turn backup off, since most stuff is in git
" -----------------------------------------------------
set nobackup
set nowb
set noswapfile

" -----------------------------------------------------
" 2.4 Spelling settings
" -----------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set nospell " Off by default

" -----------------------------------------------------
" 2.4 Persistent undo, for non-git projects
" -----------------------------------------------------
if has('persistent_undo')
  if !isdirectory('.git')
    " Save undo history to file
    set undofile
    " Undo files in folder (this folder must exists!)
    set undodir=~/.config/nvim/tmp/undo//
    " Maximum number of undos
    set undolevels=1000
    " Save complete files for undo on reload if it has less lines than this
    set undoreload=1000
  endif
endif

" -----------------------------------------------------
" 2.5 Highlight whitespaces
" -----------------------------------------------------
set listchars=tab:>\ ,trail:·,extends:#,nbsp:·

" -----------------------------------------------------
" 2.6 Filetype settings
" -----------------------------------------------------
filetype off
filetype plugin on
filetype indent on

" -----------------------------------------------------
" 2.7 Folding settings, by default is disabled, use 'za'
" -----------------------------------------------------
set foldmethod=marker
set foldlevelstart=2
set fillchars="fold: "

" -----------------------------------------------------
" 2.8 Omni completion settings
" -----------------------------------------------------

" Don't show preview scratch buffers
set completeopt-=preview

" -----------------------------------------------------
" 2.9 Completion ignore list
" -----------------------------------------------------
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" -----------------------------------------------------
" 2.10 Neovim specific settings
" -----------------------------------------------------
" Set an environment variable to use the t_SI/t_EI hack
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Turn on true colors support (does not work inside tmux)
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" -----------------------------------------------------
" 2.11 Ctags settings
" -----------------------------------------------------
set tags+=.tags

" -----------------------------------------------------
" 2.12 Clever F settings
" -----------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs=';'
"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leaders
" -----------------------------------------------------
let g:mapleader="\<space>"

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <bs> <nop>
nnoremap <delete> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <Space> <nop>
inoremap <F1> <nop>
nnoremap <F1> <nop>
nnoremap Q <nop>

" -----------------------------------------------------
" 3.3 Vim defaults overriding
" -----------------------------------------------------

" Intelligent window cycling
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap j gj
noremap k gk
nnoremap gj 5j
nnoremap gk 5k

" When jump to next match also center screen
noremap n nzz
noremap N Nzz

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (defaul was alias for yy)
nnoremap Y y$

" Quick replay q macro
nnoremap Q @q

" Cancel terminal mode with ,escape
tnoremap ,<ESC> <C-\><C-n>

" Automatically reselect and yank overpasted text in visual mode
xnoremap p pgvy

" Omni-complete based on ctags
inoremap <C-x><C-]> <C-]>

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Don't copy over-pasted text in visual mode
xnoremap p "_dP

" -----------------------------------------------------
" 3.4 Common tasks
" -----------------------------------------------------

" Quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -----------------------------------------------------
" 3.5 F-key actions
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Run Neomake (run command asynchronously)
nnoremap <silent> <F2> :Neomake
" Paste mode toggling
nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>
" Toggle spelling on and off
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New horizontal term buffer
nnoremap <silent> <F8> :call utils#newVertTerm()<CR>
" Free
" nnoremap <silent> <F9> :Command<CR>
" Free
" nnoremap <silent> <F10> :Command<CR>
" Free
" nnoremap <silent> <F11> :Command<CR>
" Echo out toggles legend on <F12>
nnoremap <F12> :call utils#showToggles()<CR>

" -----------------------------------------------------
" 3.6 Window / Buffer management
" -----------------------------------------------------

" Windows resizing using arrow keys
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings
" -----------------------------------------------------

" Quiting and saving all
cmap ww wqall
cmap qq qall

" Accepting case errors
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" -----------------------------------------------------
" 3.7 Custom commands and functions
" -----------------------------------------------------

" Generate tags definitions
command! GenerateCT :call utils#generateCtags()
command! GenerateJSCT :call utils#generateJSCtags()
command! GenerateRubyCT :call utils#generateRubyCtags()

" Rename current file
command! Rename :call utils#renameFile()<CR>

" Create new note
command! -nargs=1 Note :call utils#createNote(<f-args>)

" Open note
command! Notes :call utils#openNotes()

" Run current file
command! Run :call utils#runCurrentFile()
nnoremap <silent> ,r :Run<CR>

" Reformat whole or selection from file
command! Format :call utils#formatFile()
nnoremap <silent> ,f :Format<CR>

" Annotate file (show values in special # => comments)
command! Annotate :call utils#annotateFile()
nnoremap <silent> ,a :Annotate<CR>

" -----------------------------------------------------
" 3.8 TAB autocomplete mappings
" -----------------------------------------------------

" Multipurpose tab key (inspired by Gary Bernhardt)
inoremap <expr> <tab> utils#insertTabWrapper()
inoremap <s-tab> <C-n>
"}}}

" ======================================================================================================================
" 4.0 Plugins settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 4.1 Auto-switch keyboard layout
" -----------------------------------------------------
let g:utils_autoswitch_kb_layout=0

" -----------------------------------------------------
" 4.2 Unite
" -----------------------------------------------------

" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C0'
  let g:unite_source_grep_recursive_opt=''

  " Set rec source command
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Custom unite menus
let g:unite_source_menu_menus = {}

" Utils menu
let g:unite_source_menu_menus.utils = {
      \     'description' : 'Utility commands',
      \ }
let g:unite_source_menu_menus.utils.command_candidates = [
      \       ['Color picker', 'VCoolor'],
      \       ['Annotate file', 'Annotate'],
      \       ['Format file', 'Format'],
      \       ['Run file', 'Run'],
      \       ['Rename file', 'Rename'],
      \       ['Generate Ctags', 'GenerateCT'],
      \       ['Generate JS Ctags', 'GenerateJSCT'],
      \       ['Generate Ruby/Rails Ctags', 'GenerateRailsCT'],
      \       ['Show notes', 'Notes'],
      \     ]

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Unite Log', 'Unite giti/log'],
      \       ['Visual Log', 'Gitv'],
      \     ]

" Plug menu
let g:unite_source_menu_menus.plug = {
      \     'description' : 'Plugin management commands',
      \ }
let g:unite_source_menu_menus.plug.command_candidates = [
      \       ['Install plugins', 'PlugInstall'],
      \       ['Update plugins', 'PlugUpdate'],
      \       ['Clean plugins', 'PlugClean'],
      \       ['Upgrade vim-plug', 'PlugUpgrade'],
      \     ]

" My unite menu
let g:unite_source_menu_menus.unite = {
      \     'description' : 'My Unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = [
      \       ['Unite MRUs', 'call utils#uniteMRUs()'],
      \       ['Unite buffers', 'call utils#uniteBuffers()'],
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite grep', 'call utils#uniteGrep()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \     ]

" -----------------------------------------------------
" 4.3 NERDTree
" -----------------------------------------------------
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let g:NERDTreeWinSize=50

" -----------------------------------------------------
" 4.4 Ultisnips settings
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3

" -----------------------------------------------------
" 4.5 Gitgutter settings
" -----------------------------------------------------
let g:gitgutter_max_signs=9999

" -----------------------------------------------------
" 4.6 Vim JSX highlighting settings
" -----------------------------------------------------
let g:jsx_ext_required=0

" -----------------------------------------------------
" 4.7 Lightline settings
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'capslock' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'capslock': '%{exists("*CapsLockStatusline")?CapsLockStatusline():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" -----------------------------------------------------
" 4.8 Color picker settings
" -----------------------------------------------------
let g:vcoolor_disable_mappings=1

" -----------------------------------------------------
" 4.9 Neomake settings
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
    \ 'text': '>',
    \ 'texthl': 'WarningMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': '>',
    \ 'texthl': 'ErrorMsg',
    \ }

" -----------------------------------------------------
" 4.10 Ruby refactoring settings
" -----------------------------------------------------
let g:ruby_refactoring_map_keys=0

" -----------------------------------------------------
" 4.11 NeoTerm settings
" -----------------------------------------------------
let g:neoterm_size=60
let g:neoterm_position='vertical'

" -----------------------------------------------------
" 4.12 Vim-Test settings
" -----------------------------------------------------
let g:test#strategy = "neoterm"
"}}}

" ======================================================================================================================
" 5.0 Plugin mappings
" ======================================================================================================================
"{{{
" -----------------------------------------------------
" 5.1 Unite and extensions
" -----------------------------------------------------

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  " Runs 'splits' action by <C-s> and <C-v>
  imap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " Exit with escape
  nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
  " Mark candidates
  vmap <silent> <buffer> m <Plug>(unite_toggle_mark_selected_candidates)
  nmap <silent> <buffer> m <Plug>(unite_toggle_mark_current_candidate)
endfunction

" [U]nite sources
nnoremap <silent> <leader>u :call utils#uniteSources()<CR>
" [O]pen files recursively
nnoremap <silent> <leader>o :call utils#uniteFileRec()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :call utils#uniteBuffers()<CR>
" Search in current file [t]ags
nnoremap <silent> <leader>t :call utils#uniteTags()<CR>
" Search for term - [g]rep
nnoremap <silent> <leader>g :call utils#uniteGrep()<CR>
" Search in edit [h]istory
nnoremap <silent> <leader>h :call utils#uniteHistory()<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :call utils#uniteLineSearch()<CR>
" Search in [y]ank history
nnoremap <silent> <leader>y :call utils#uniteYankHistory()<CR>
" Search in [r]egisters
nnoremap <silent> <leader>r :call utils#uniteRegisters()<CR>
" Search in opened [w]indow splits
nnoremap <silent> <leader>w :call utils#uniteWindows()<CR>
" Search in ultisnips [s]nippets
nnoremap <silent> <leader>s :call utils#uniteSnippets()<CR>
" My custom unite [m]enu with commonly used commands not mapped to keys
nnoremap <silent> <leader>m :call utils#uniteCustomMenu()<CR>

" -----------------------------------------------------
" 5.2 Ultisnips
" -----------------------------------------------------
" Disable built-in cx-ck to be able to go backward
inoremap <C-x><C-k> <nop>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" -----------------------------------------------------
" 5.3 Isolate
" -----------------------------------------------------
vnoremap ,i :Isolate<CR>
nnoremap ,u :UnIsolate<CR>
"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting
syntax on

" XTerm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
  set t_Co=256
endif

" Color scheme based on time
if strftime("%H") < 14
  let g:badfox_html_link_underline=0
  colorscheme badfox
elseif strftime("%H") < 20
  let g:rehash256 = 1
  colorscheme molokai
else
  set bg=dark
  colorscheme hybrid
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Remove underline in folded lines
hi Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" ======================================================================================================================
" 7.0 Filetype specific settings and autocommands
" ======================================================================================================================
"{{{
autocmd FileType ruby,coffee,sass,scss,haml,slim,vim setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType html,htmldjango,xhtml,css,javascript,javascript.jsx,snippets setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120

" Keywordprg settings
autocmd FileType vim setlocal keywordprg=:help

" make CSS omni-completion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.sass set ft=sass.css

" Close vim if the last open window is nerdtree
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Keyboard layout switching
if g:utils_autoswitch_kb_layout == 1
  autocmd InsertEnter * call utils#setSKKBLayout()
  autocmd InsertLeave * call utils#setUSKBLayout()
end

" Run linters after save
autocmd BufWritePost *.js Neomake eslint
autocmd BufWritePost *.rb Neomake rubocop
autocmd BufWritePost *.html Neomake tidy
autocmd BufWritePost *.scss Neomake scsslint
"}}}

" ======================================================================================================================
" 8.0 Other stuff
" ======================================================================================================================
"{{{
" Load other scripts
if filereadable(expand("~/config/dot-files/vim/scripts/utils.vim"))
  source ~/config/dot-files/vim/scripts/utils.vim
else
  echo "Update path to utils scripts!"
endif
"}}}
