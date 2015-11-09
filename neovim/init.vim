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

" ---------------------------------------------------------------------------------------------------------------------
" Ruby/Rails
" ---------------------------------------------------------------------------------------------------------------------

" Ruby syntax (plays nicely with https://github.com/tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Slim syntax
Plug 'slim-template/vim-slim'
" Haml syntax
Plug 'tpope/vim-haml'
" Rails support (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Bundler support (play nicely with https://github.com/tpope/gem-ctags)
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" String interpolation helper
Plug 'p0deje/vim-ruby-interpolation', { 'for': ['ruby'] }
" Refactoring tools
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }

" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS/JS
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" JS syntax
Plug 'othree/yajs.vim'
" JS libs syntax (React, Angular)
Plug 'othree/javascript-libraries-syntax.vim'
" JSX syntax (needs vim-javascript for indentation)
Plug 'mxw/vim-jsx' | Plug 'pangloss/vim-javascript'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" JSON syntax
Plug 'sheerun/vim-json'

" Sparkup, emmet alternative (<C-e> to expand expression)
Plug 'rstacruz/sparkup', { 'for': ['html', 'xhtml', 'eruby'] }
" CSS color highlighter
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }

" ---------------------------------------------------------------------------------------------------------------------
" Other languages
" ---------------------------------------------------------------------------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Python syntax
Plug 'mitsuhiko/vim-python-combined'
" Elm
Plug 'lambdatoast/elm.vim'
" Tmux syntax
Plug 'tejr/vim-tmux'
" Git syntax
Plug 'tpope/vim-git'
" Dockerfile
Plug 'honza/dockerfile.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Unite fuzzy searcher
" ---------------------------------------------------------------------------------------------------------------------

" Unite files, buffers, command sources | Async source depends on vimproc
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Outline source
Plug 'Shougo/unite-outline'
" History/yank source
Plug 'Shougo/neoyank.vim'
" MRU source
Plug 'Shougo/neomru.vim'
" Tag source
Plug 'tsukkee/unite-tag'

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'
" Highlight long lines
Plug 'whatyouhide/vim-lengthmatters'

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
" Neovim terminal improving
Plug 'kassio/neoterm', { 'on': 'T' }

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation
" ---------------------------------------------------------------------------------------------------------------------

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Additional text objects
Plug 'wellle/targets.vim'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Software capslock (gC in normal mode, <C-G>c in insert mode)
Plug 'tpope/vim-capslock'

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes
" ---------------------------------------------------------------------------------------------------------------------

" Molokai
Plug 'tomasr/molokai'
" Iceberg
Plug 'cocopon/iceberg.vim'
" Jellybeans
Plug 'nanotech/jellybeans.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Other
" ---------------------------------------------------------------------------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Search for highlighted work with *
Plug 'thinca/vim-visualstar'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" Hacker typing
Plug 'natw/keyboard_cat.vim', { 'on':  'PlayMeOff' }
" Man reading in vim
Plug 'jez/vim-superman'
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
set number                                  " Line numbers on
set laststatus=2                            " Always show status line
set showmode                                " Always show mode
set wildmenu                                " Better auto-complete of ex commands
set textwidth=120                           " Text width is 120 characters
set autoread                                " Automatically reload change files on disk
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set timeoutlen=300                          " ESC timeout
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set history=4096                            " Size of commands history
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set backspace=indent,eol,start              " Set default behavior of backspace
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set mouse=a                                 " Enable mouse integration

" ---------------------------------------------------------------------------------------------------------------------
" 2.1 Indentation settings (2 spaces tabs)
" ---------------------------------------------------------------------------------------------------------------------
set expandtab                               " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=0                            " Zero so the 'ts' value will be used
set softtabstop=-1                          " When 'sts' is negative, the value of 'shiftwidth' is used
set tabstop=4                               " Number of spaces that a <Tab> in the file counts for

" ---------------------------------------------------------------------------------------------------------------------
" 2.2 Split settings (more natural).
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" ---------------------------------------------------------------------------------------------------------------------
" 2.3 Backup settings (defaults + noswapfile)
" ---------------------------------------------------------------------------------------------------------------------
set noswapfile                              " New buffers will be loaded without creating a swapfile

" ---------------------------------------------------------------------------------------------------------------------
" 2.4 Spelling settings
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)

" ---------------------------------------------------------------------------------------------------------------------
" 2.5 Search settings
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set incsearch                               " Incremental search
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 Persistent undo settings
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 White characters settings
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:>\ ,trail:·,extends:#,nbsp:·

" ---------------------------------------------------------------------------------------------------------------------
" 2.8 Filetype settings
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on

" ---------------------------------------------------------------------------------------------------------------------
" 2.9 Folding settings (by default is disabled, use 'za')
" ---------------------------------------------------------------------------------------------------------------------
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevelstart=2                        " At which level folds will be closed by default
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Omni completion settings
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

" ---------------------------------------------------------------------------------------------------------------------
" 2.11 Neovim specific settings
" ---------------------------------------------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1       " Set an environment variable to use the t_SI/t_EI hack
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1       " Turn on true colors support (does not work inside tmux yet)

" -----------------------------------------------------
" 2.12 Ctags settings
" -----------------------------------------------------
set tags+=.tags                           " Look for .tags file as well
"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leader
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

" More useful enter and backspace
nnoremap <CR> G
nnoremap <BS> gg

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

" Omni-complete based on ctags
inoremap <C-]> <C-x><C-]>

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text
" Also, don't copy over-pasted text in visual mode
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" No more accidentally showing up command window (Use C-f to show it)
map q: :q

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
      \       ['Run XMPFilter', 'Annotate'],
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
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite grep', 'call utils#uniteGrep()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite symbols', 'call utils#uniteOutline()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \     ]

" -----------------------------------------------------
" 4.3 NERDTree
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=55
let g:NERDTreeAutoDeleteBuffer=1

" -----------------------------------------------------
" 4.4 Ultisnips settings
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3

" -----------------------------------------------------
" 4.5 Gitgutter settings
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'

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

" -----------------------------------------------------
" 4.13 Clever F settings
" -----------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs=';'

" -----------------------------------------------------
" 4.14 Multiple cursors settings
" -----------------------------------------------------
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
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

" Search files recursively (Ctrl-[P] mnemonics)
nnoremap <silent> <leader>p :call utils#uniteFileRec()<CR>
" [U]nite sources
nnoremap <silent> <leader>u :call utils#uniteSources()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :call utils#uniteBuffers()<CR>
" Search in current file [o]utline
nnoremap <silent> <leader>o :call utils#uniteOutline()<CR>
" Search project [t]ags
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

" -----------------------------------------------------
" 5.4 Gitgutter
" -----------------------------------------------------
nnoremap [c :GitGutterPrevHunk<CR>
nnoremap ]c :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>

" -----------------------------------------------------
" 5.5 Expand region
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting
syntax on

" Color scheme based on time
if strftime("%H") < 15
  let g:rehash256 = 1
  colorscheme molokai
elseif strftime("%H") < 20
  colorscheme jellybeans
else
  colorscheme iceberg
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Remove underline in folded lines
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Statement
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}

" ======================================================================================================================
" 7.0 Filetype specific settings and autocommands
" ======================================================================================================================
"{{{
autocmd FileType ruby,coffee,sass,scss,haml,slim,vim setlocal tabstop=2
autocmd FileType html,htmldjango,xhtml,css,javascript,javascript.jsx,snippets setlocal tabstop=4

" Set underscore as a word separator
autocmd FileType ruby,erb,elixir setlocal iskeyword -=_
" Set dash as a word separator
autocmd FileType html,xhtml,css,scss.css,less.css setlocal iskeyword -=-

" Keywordprg settings
autocmd FileType vim setlocal keywordprg=:help

" Turn spellcheck on for markdown files.
autocmd BufNewFile,BufRead *.md setlocal spell

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
autocmd BufWritePost *.sh Neomake shellcheck
"}}}
