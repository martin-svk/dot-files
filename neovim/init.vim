" ######################################################################################################################
" ### Author : Martin Toma <martin.toma.svk@gmail.com>                                                               ###
" ######################################################################################################################
" ### Neovim Configuration focused on Web development                                                                ###
" ### Neovimmer since : Tue Oct 14 2014                                                                              ###
" ### Vimmer since    : Tue Nov 12 2013                                                                              ###
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
" Language agnostic plugins"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim'
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Snippet support (C-j)
Plug 'SirVer/ultisnips'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Multi-language testing support
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] }
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Ruby/Rails"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Ruby syntax (plays nicely with tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Slim syntax
Plug 'slim-template/vim-slim'
" Haml syntax
Plug 'tpope/vim-haml'
" Minitest syntax
Plug 'sunaku/vim-ruby-minitest'
" Rails support (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Bundler support (play nicely with tpope/gem-ctags)
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" String interpolation helper
Plug 'p0deje/vim-ruby-interpolation', { 'for': ['ruby'] }
" Refactoring tools
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" JS (ES6, React)"{{{
" ---------------------------------------------------------------------------------------------------------------------

" JS syntax
Plug 'othree/yajs.vim'
" JS libs syntax (React, Angular)
Plug 'othree/javascript-libraries-syntax.vim'
" JSX syntax (needs vim-javascript for indentation)
Plug 'mxw/vim-jsx' | Plug 'pangloss/vim-javascript'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS"{{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Emmet (<C-e> to expand expression)
Plug 'mattn/emmet-vim', { 'for': [ 'css', 'scss', 'less', 'sass', 'html', 'xhtml', 'javascript.jsx' ] }
" CSS color highlighter
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Python syntax
Plug 'mitsuhiko/vim-python-combined'
" Elm
Plug 'lambdatoast/elm.vim'
" Markdown syntax and helpers
Plug 'plasticboy/vim-markdown'
" Tmux syntax
Plug 'tejr/vim-tmux'
" Git syntax
Plug 'tpope/vim-git'
" Dockerfile
Plug 'honza/dockerfile.vim'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Crystal lang
Plug 'rhysd/vim-crystal'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Unite fuzzy searcher"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Unite files, buffers, command sources (Grep source depends on vimproc)
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Outline source
Plug 'Shougo/unite-outline'
" History/yank source
Plug 'Shougo/neoyank.vim'
" MRU source
Plug 'Shougo/neomru.vim'
" Tag source
Plug 'tsukkee/unite-tag'
" Ag wrapper (Unite grep alternative) search and edit
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Nerdtree git status
Plug 'Xuyuanp/nerdtree-git-plugin'
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'
" Highlight long lines
Plug 'whatyouhide/vim-lengthmatters'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
" Git log viewer
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" Color picker
Plug 'KabbAmine/vCoolor.vim', { 'on': 'VCoolor' }
" Neovim terminal improving
Plug 'kassio/neoterm', { 'on': 'T' }
" Unix commands integration
Plug 'tpope/vim-eunuch', { 'on': [ 'Rename', 'Move', 'SudoWrite' ] }
" REST Console
Plug 'diepm/vim-rest-console', { 'for': 'rest' }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Highlight jump characters on f, F, t, T
Plug 'unblevable/quick-scope'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Software capslock (<F2>/gC in normal mode, <C-G>c in insert mode)
Plug 'tpope/vim-capslock', { 'on': '<Plug>CapsLockToggle' }
" Cycling related words via C-a C-x (i.e. true/false)
Plug 'zef/vim-cycle'
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Extra text objects"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Custom text objects creation (dependency for the latter)
Plug 'kana/vim-textobj-user'
" Argument text object (via, >a)
Plug 'PeterRincker/vim-argumentative'
" Indent text object (vii)
Plug 'kana/vim-textobj-indent'
" Line text object (vil)
Plug 'kana/vim-textobj-line'
" Entire buffer text object (vae)
Plug 'kana/vim-textobj-entire'
" Ruby block text object (vir)
Plug 'nelstrom/vim-textobj-rubyblock'
" Comment text object (vac)
Plug 'glts/vim-textobj-comment'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Molokai
Plug 'tomasr/molokai'
" Iceberg
Plug 'cocopon/iceberg.vim'
" Jellybeans
Plug 'nanotech/jellybeans.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other"{{{
" ---------------------------------------------------------------------------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Search for highlighted word with *
Plug 'thinca/vim-visualstar'
" Improve star by not jumping immediately
Plug 'ironhouzi/vim-stim'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" Man reading in vim
Plug 'jez/vim-superman'
" Matchit enhances jump motions
Plug 'edsono/vim-matchit'
" More . repeat functionality
Plug 'tpope/vim-repeat'
" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" Populate arglist with buffers in quickfix list
Plug 'nelstrom/vim-qargs', { 'on': 'Qargs' }
"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults)"{{{
" ======================================================================================================================
"{{{

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.1 Split settings (more natural)."{{{
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.2 Timeout settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.3 Spelling settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.4 Search settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.5 Persistent undo settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 White characters settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 Filetype settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.8 Folding settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=1                             " Start folding automatically from level 1
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.9 Omni completion settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings"{{{
" ---------------------------------------------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1       " Set an environment variable to use the t_SI/t_EI hack
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1       " Turn on true colors support (does not work inside tmux yet)
"}}}

" -----------------------------------------------------
" 2.11 Ctags settings"{{{
" -----------------------------------------------------
" For Ruby STD ctags use tpope/rbenv-ctags + vim-ruby
" For gem ctags use tpope/gem-ctags + vim-bundler
" -----------------------------------------------------
set tags+=.tags                           " Project tags are in .tags file
"}}}

"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leader"{{{
" -----------------------------------------------------
let g:mapleader="\<space>"
"}}}

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter"{{{
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
"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding"{{{
" -----------------------------------------------------

" Easier window switching
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (defaul was alias for yy)
nnoremap Y y$

" Quick replay q macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text
" Also, don't copy over-pasted text in visual mode
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Cancel terminal mode with ,escape
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz
"}}}

" -----------------------------------------------------
" 3.4 Common tasks"{{{
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

" CTags navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>

" QuickFix navigation
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za
"}}}

" -----------------------------------------------------
" 3.5 F-key actions"{{{
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Caps lock mode toggling
nnoremap <silent> <F2> :execute "normal \<Plug>CapsLockToggle"<CR>
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
" Fire REST Request
nnoremap <silent> <F9> :call VrcQuery()<CR>
" Free
" nnoremap <silent> <F10>
" Howdoi integration (pip install howdoi)
nnoremap <silent> <F11> :call utils#howDoI()<CR>
" Echo out toggles legend on <F12>
nnoremap <F12> :call utils#showToggles()<CR>
"}}}

" -----------------------------------------------------
" 3.6 Window / Buffer management"{{{
" -----------------------------------------------------

" Intelligent windows resizing using arrow keys
nnoremap <silent> <Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
"}}}

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings"{{{
" -----------------------------------------------------

" Substitution
cnoremap ss %s/

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall
"}}}

" -----------------------------------------------------
" 3.8 Custom commands and functions"{{{
" -----------------------------------------------------

" Generate tags definitions
command! GenerateCT :call utils#generateCtags()
command! GenerateJSCT :call utils#generateJSCtags()
command! GenerateRubyCT :call utils#generateRubyCtags()

" Open notes
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

" Profile
command! Profile :call utils#profile()
"}}}

"}}}

" ======================================================================================================================
" 4.0 Plugins settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 4.1 Auto-switch keyboard layout"{{{
" -----------------------------------------------------
let g:utils_autoswitch_kb_layout=0
"}}}

" -----------------------------------------------------
" 4.2 Unite"{{{
" -----------------------------------------------------

" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
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

" Dont override status line
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" Utils menu
let g:unite_source_menu_menus.utils = {
      \     'description' : 'Utility commands',
      \ }
let g:unite_source_menu_menus.utils.command_candidates = [
      \       ['Color picker', 'VCoolor'],
      \       ['Run XMPFilter', 'Annotate'],
      \       ['Format file', 'Format'],
      \       ['Run file', 'Run'],
      \       ['Generate Ctags', 'GenerateCT'],
      \       ['Generate JS Ctags', 'GenerateJSCT'],
      \       ['Show notes', 'Notes'],
      \     ]

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage hunk', 'GitGutterStageHunk'],
      \       ['Unstage hunk', 'GitGutterRevertHunk'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
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
      \       ['Unite file browse', 'call utils#uniteFileBrowse()'],
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite grep', 'call utils#uniteGrep()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite file tags (symbols)', 'call utils#uniteOutline()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \       ['Unite jump history', 'call utils#uniteJumps()'],
      \     ]
"}}}

" -----------------------------------------------------
" 4.3 NERDTree"{{{
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=55
let g:NERDTreeAutoDeleteBuffer=1
"}}}

" -----------------------------------------------------
" 4.4 Ultisnips settings"{{{
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3
"}}}

" -----------------------------------------------------
" 4.5 Gitgutter settings"{{{
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'
"}}}

" -----------------------------------------------------
" 4.6 Vim JSX highlighting settings"{{{
" -----------------------------------------------------
let g:jsx_ext_required=0
"}}}

" -----------------------------------------------------
" 4.7 Lightline settings"{{{
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'paste', 'capslock' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}',
      \   'capslock': '%{exists("*CapsLockStatusline")?CapsLockStatusline("CAPS"):""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
"}}}

" -----------------------------------------------------
" 4.8 Color picker settings"{{{
" -----------------------------------------------------
let g:vcoolor_disable_mappings=1
"}}}

" -----------------------------------------------------
" 4.9 Neomake settings"{{{
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }
"}}}

" -----------------------------------------------------
" 4.10 Ruby refactoring settings"{{{
" -----------------------------------------------------
let g:ruby_refactoring_map_keys=0
"}}}

" -----------------------------------------------------
" 4.11 NeoTerm settings"{{{
" -----------------------------------------------------
let g:neoterm_size=60
let g:neoterm_position='vertical'
"}}}

" -----------------------------------------------------
" 4.12 Vim-Test settings"{{{
" -----------------------------------------------------
let g:test#strategy = "neoterm"
"}}}

" -----------------------------------------------------
" 4.13 Clever F settings"{{{
" -----------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs=';'
"}}}

" -----------------------------------------------------
" 4.14 Multiple cursors settings"{{{
" -----------------------------------------------------
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
"}}}

" -----------------------------------------------------
" 4.15 Vim Markdown settings"{{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
"}}}

" -----------------------------------------------------
" 4.16 Vim REST console settings"{{{
" -----------------------------------------------------
let g:vrc_set_default_mapping=0
let g:vrc_output_buffer_name='__RESPONSE__.rest'
"}}}

" -----------------------------------------------------
" 4.17 Emmet settings"{{{
" -----------------------------------------------------
let g:user_emmet_expandabbr_key = '<C-e>'
"}}}

" -----------------------------------------------------
" 4.18 Quick scope settings"{{{
" -----------------------------------------------------
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
"}}}

" -----------------------------------------------------
" 4.19 Deoplete autocomplete settings"{{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=2

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"}}}

" -----------------------------------------------------
" 4.20 Ctrl-SF settings"{{{
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=1
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '50%'
"}}}

" -----------------------------------------------------
" 4.21 Javascript libraries syntax settings"{{{
" -----------------------------------------------------
let g:used_javascript_libs = 'chai,flux,react,underscore'
"}}}

" -----------------------------------------------------
" 4.22 Nerdtree git status settings"{{{
" -----------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "+",
      \ "Staged"    : "+",
      \ "Untracked" : "?",
      \ "Renamed"   : "↪",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "¬",
      \ "Dirty"     : "*",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }
"}}}

"}}}

" ======================================================================================================================
" 5.0 Plugin mappings
" ======================================================================================================================
"{{{
" -----------------------------------------------------
" 5.1 Unite and extensions"{{{
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

" Search files recursively ([o]pen file)
nnoremap <silent> <leader>o :call utils#uniteFileRec()<CR>
" Browse [f]iles in CWD
nnoremap <silent> <leader>f :call utils#uniteFileBrowse()<CR>
" [U]nite sources
nnoremap <silent> <leader>u :call utils#uniteSources()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :call utils#uniteBuffers()<CR>
" Search in current file ou[t]line (tags in current file)
nnoremap <silent> <leader>t :call utils#uniteOutline()<CR>
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
" Search in latest [j]ump positions
nnoremap <silent> <leader>j :call utils#uniteJumps()<CR>
" Search in my custom unite [m]enu with my commands
nnoremap <silent> <leader>m :call utils#uniteCustomMenu()<CR>
" Seach in help menu for commands
nnoremap <silent> <leader>? :call utils#uniteCommands()<CR>
" Seach in help menu for mappings
nnoremap <silent> ,? :call utils#uniteMappings()<CR>
"}}}

" -----------------------------------------------------
" 5.2 Ultisnips"{{{
" -----------------------------------------------------
" Disable built-in cx-ck to be able to go backward
inoremap <C-x><C-k> <nop>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"}}}

" -----------------------------------------------------
" 5.3 Isolate"{{{
" -----------------------------------------------------
vnoremap ,i :Isolate<CR>
nnoremap ,u :UnIsolate<CR>
"}}}

" -----------------------------------------------------
" 5.4 Gitgutter"{{{
" -----------------------------------------------------
nnoremap [c :GitGutterPrevHunk<CR>
nnoremap ]c :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>
"}}}

" -----------------------------------------------------
" 5.5 Expand region"{{{
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" -----------------------------------------------------
" 5.6 Vim Markdown"{{{
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader
"}}}

" -----------------------------------------------------
" 5.7 Argumentative (use a instead of ,)"{{{
" -----------------------------------------------------
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject
nmap [a <Plug>Argumentative_Prev
nmap ]a <Plug>Argumentative_Next
xmap [a <Plug>Argumentative_XPrev
xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight
"}}}

" -----------------------------------------------------
" 5.8 Deoplete autocomplete"{{{
" -----------------------------------------------------
" Select next match or trigger manual complete
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> deoplete#mappings#manual_complete("tag")

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction
"}}}

" -----------------------------------------------------
" 5.9 CtrlSF "{{{
" -----------------------------------------------------
nnoremap <leader>a :CtrlSF<Space>
nnoremap <leader>A :CtrlSFToggle<CR>
"}}}

" -----------------------------------------------------
" 5.10 Vim-Test "{{{
" -----------------------------------------------------
nnoremap ,tf :TestFile<CR>
nnoremap ,tn :TestNearest<CR>
nnoremap ,ta :TestSuite<CR>
nnoremap ,tt :TestLast<CR>
"}}}

"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting"{{{
syntax on
"}}}

" Color scheme based on time"{{{
if strftime("%H") < 14
  let g:rehash256 = 1
  colorscheme molokai
elseif strftime("%H") < 20
  colorscheme iceberg
else
  colorscheme jellybeans
endif
"}}}

" Highlight VCS conflict markers"{{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently"{{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Listchars highlighting"{{{
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray
"}}}

" Remove underline in folded lines"{{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors"{{{
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}

"}}}

" ======================================================================================================================
" 7.0 Autocommands
" ======================================================================================================================
"{{{

" Keywordprg settings"{{{
autocmd FileType vim setlocal keywordprg=:help
"}}}

" Turn spellcheck on for markdown files."{{{
autocmd BufNewFile,BufRead *.md setlocal spell
"}}}

" Remove trailing whitespaces automatically before save"{{{
autocmd BufWritePre * call utils#stripTrailingWhitespaces()
"}}}

" Resize splits when the window is resized"{{{
autocmd VimResized * :wincmd =
"}}}

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh."{{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Keyboard layout switching"{{{
if g:utils_autoswitch_kb_layout == 1
  autocmd InsertEnter * call utils#setSKKBLayout()
  autocmd InsertLeave * call utils#setUSKBLayout()
end
"}}}

" -----------------------------------------------------
" 7.1 Run linters after save"{{{
" -----------------------------------------------------

" npm install -g eslint
autocmd BufWritePost *.js Neomake eslint
" gem install rubocop
autocmd BufWritePost *.rb Neomake rubocop
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy
" gem install scsslint
autocmd BufWritePost *.scss Neomake scsslint
" apt-get install shellcheck
autocmd BufWritePost *.sh Neomake shellcheck
" pip3 install vim-vint
autocmd BufWritePost *.vim Neomake vint
"}}}

"}}}

" ======================================================================================================================
" 8.0 Todo, Notes
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 8.1 Todo"{{{
" -----------------------------------------------------
" 1. Revisit all plugins, set up 2nd level mappings.
" 2. Remove obsolete plugins.
" 3. Update README file.
"}}}

" -----------------------------------------------------
" 8.2 Notes"{{{
" -----------------------------------------------------
"}}}

"}}}
