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

" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}
call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.1 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Snippet support (C-j)
Plug 'SirVer/ultisnips'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Ruby/Rails {{{
" ---------------------------------------------------------------------------------------------------------------------

" Ruby support (plays nicely with tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Slim syntax
Plug 'slim-template/vim-slim'
" Haml syntax
Plug 'tpope/vim-haml'
" Minitest syntax
Plug 'sunaku/vim-ruby-minitest'
" Rails support (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Bundler support (plays nicely with tpope/gem-ctags)
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" JS (ES6, React) {{{
" ---------------------------------------------------------------------------------------------------------------------

" Modern JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'mxw/vim-jsx'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" Autocomplete (npm install -g tern)
Plug 'carlitux/deoplete-ternjs'
" JS Documentation comments
Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Elm support
Plug 'ElmCast/elm-vim'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Fuzzy searching/replacing/etc
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Ag wrapper search and edit
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
" Git swiss-army knife
Plug 'tpope/vim-fugitive'
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" Color picker
Plug 'KabbAmine/vCoolor.vim', { 'on': ['VCoolor', 'VCase'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Cycling related words via C-a C-x (i.e. true/false)
Plug 'zef/vim-cycle'
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'
" Show content of registers when pasting
Plug 'junegunn/vim-peekaboo'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Extra text objects {{{
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
" Comment text object (vac)
Plug 'glts/vim-textobj-comment'
" XML attribute
Plug 'whatyouhide/vim-textobj-xmlattr'
" Improved targets line cin) next parens
Plug 'wellle/targets.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes {{{
" ---------------------------------------------------------------------------------------------------------------------

" Hybrid
Plug 'w0ng/vim-hybrid'
" Badwolf
Plug 'sjl/badwolf'
" Molokai
Plug 'tomasr/molokai'
" Iceberg
Plug 'cocopon/iceberg.vim'
" Tender
Plug 'jacoborus/tender.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
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
" Matchit enhances jump motions
Plug 'tmhedberg/matchit'
" More . repeat functionality
Plug 'tpope/vim-repeat'
" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" Did you mean file open
Plug 'EinfachToll/DidYouMean'
"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
"{{{

set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
scriptencoding utf-8                        " Set utf-8 as default script encoding

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
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=160                           " Don't try to syntax highlight minified files
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.1 Split settings (more natural) {{{
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.2 Timeout settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.3 Spelling settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.4 Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.5 Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 Filetype settings {{{
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.8 Folding settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.9 Omni completion settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                   " Set an environment variable to use the t_SI/t_EI hack
  let g:loaded_python_provider=1                        " Disable python 2 interface
  let g:python_host_skip_check=1                        " Skip python 2 host check
  let g:python3_host_prog='/usr/local/bin/python3'      " Set python 3 host program
  set inccommand=nosplit                                " Live preview of substitutes and other similar commands
endif
"}}}

" -----------------------------------------------------
" 2.11 Ctags settings {{{
" -----------------------------------------------------
" For Ruby STD ctags use tpope/rbenv-ctags + vim-ruby
" For gem ctags use tpope/gem-ctags + vim-bundler
" For project tags generation use gem install starscope
" -----------------------------------------------------
"}}}

" -----------------------------------------------------
" 2.12 True colors settings {{{
" -----------------------------------------------------
if has('termguicolors')
  set termguicolors " Turn on true colors support
endif
"}}}

" -----------------------------------------------------
" 2.13 Language settings {{{
" -----------------------------------------------------
let $LANG = 'en_US'
"}}}

"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leader {{{
" -----------------------------------------------------
let g:mapleader="\<space>"
"}}}

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter {{{
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>
"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding {{{
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
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

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

" More logical Y (default was alias for yy)
nnoremap Y y$

" Quick replay 'q' macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
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

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Stay down after creating fold
vnoremap zf mzzf`zzz

" Make . work with visually selected lines
xnoremap . :norm.<CR>
"}}}

" -----------------------------------------------------
" 3.4 Common tasks {{{
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

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>
nnoremap ,tg :GTags<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>

" Fix spelling error on the go
inoremap <C-l> <C-g>u<ESC>[s1z=`]a<C-g>u
"}}}

" -----------------------------------------------------
" 3.5 F-key actions {{{
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
" Free
" nnoremap <silent> <F2>
" Free
" nnoremap <silent> <F3>
" Toggle spelling
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New term buffer
nnoremap <silent> <F8> :terminal<CR>
" Fire REST Request
nnoremap <silent> <F9> :call VrcQuery()<CR>
" Free
" nnoremap <silent> <F10>
" Free
" nnoremap <silent> <F11>
" Informative echo
nnoremap <F12> :call utils#showToggles()<CR>
"}}}

" -----------------------------------------------------
" 3.6 Window / Buffer management {{{
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
"}}}

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings {{{
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall
"}}}

" -----------------------------------------------------
" 3.8 Custom commands and functions {{{
" -----------------------------------------------------

" Generate tags definitions
command! GTags :call utils#generateCtags()

" Reformat whole or selection from file
command! Format :call utils#formatFile()
nnoremap <silent> ,f :Format<CR>

" Eslint fix current file
command! ESFix :call utils#eslintFixFile()

" Profile
command! Profile :call utils#profile()

" Retab
command! Retab :call utils#retabToFourSpaces()
command! Retab2 :call utils#retabToTwoSpaces()
"}}}

"}}}

" ======================================================================================================================
" 4.0 Plugins settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 4.1 Auto-switch sk -> en keyboard layouts {{{
" -----------------------------------------------------
let g:utils_autoswitch_kb_layout=0
"}}}

" -----------------------------------------------------
" 4.2 FZF {{{
" -----------------------------------------------------
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND='ag --skip-vcs-ignores -g ""'
let g:fzf_layout = { 'window': 'enew' }
"}}}

" -----------------------------------------------------
" 4.3 NERDTree {{{
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
"}}}

" -----------------------------------------------------
" 4.4 Ultisnips settings {{{
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3
"}}}

" -----------------------------------------------------
" 4.5 Gitgutter settings {{{
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
" 4.6 Vim JSX highlighting settings {{{
" -----------------------------------------------------
let g:jsx_ext_required=0
"}}}

" -----------------------------------------------------
" 4.7 Lightline settings {{{
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
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
" 4.8 Neomake settings {{{
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
" 4.9 Vim Markdown settings {{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
"}}}

" -----------------------------------------------------
" 4.10 Deoplete autocomplete settings {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['around', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['around', 'buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
"}}}

" -----------------------------------------------------
" 4.11 Ctrl-SF settings {{{
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0
"}}}

" -----------------------------------------------------
" 4.12 Plug settings {{{
" -----------------------------------------------------
let g:plug_timeout=20
"}}}

" -----------------------------------------------------
" 4.13 Vim-markdown settings {{{
" -----------------------------------------------------
let g:markdown_fenced_languages=[
      \'bash=sh',
      \'git=gitconfig',
      \'javascript',
      \'lua',
      \'ruby',
      \'tmux',
      \'viml=vim',
      \'xdefaults',
      \'zsh']
"}}}

" -----------------------------------------------------
" 4.14 Colorizer settings {{{
" -----------------------------------------------------
let g:colorizer_nomap=1
"}}}

" -----------------------------------------------------
" 4.15 Elm-vim settings {{{
" -----------------------------------------------------
let g:elm_format_autosave=0
let g:elm_setup_keybindings=0
"}}}

" -----------------------------------------------------
" 4.16 JsDoc settings {{{
" -----------------------------------------------------
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1
"}}}

"" -----------------------------------------------------
"" 4.17 Deoplete-tern settings {{{
"" -----------------------------------------------------
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=1
""}}}

"" -----------------------------------------------------
"" 4.18 vim-javascript settings {{{
"" -----------------------------------------------------
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1
""}}}

"" -----------------------------------------------------
"" 4.19 vCoolor settings {{{
"" -----------------------------------------------------
let g:vcoolor_disable_mappings=1
let g:vcoolor_lowercase=1
""}}}

"" -----------------------------------------------------
"" 4.20 YankRing settings {{{
"" ------------------------------------------------------
let g:yankring_window_height=15
""}}}

"}}}

" ======================================================================================================================
" 5.0 Plugin mappings
" ======================================================================================================================
"{{{
" -----------------------------------------------------
" 5.1 FZF {{{
" -----------------------------------------------------

" Search files recursively ([o]pen file)
nnoremap <silent> <leader>o :Files<CR>
" Search git status (edited) [f]iles
nnoremap <silent> <leader>f :GFiles?<CR>
" Search in local buffer [c]ommits
nnoremap <silent> <leader>c :BCommits<CR>
" Search in all the project [C]ommits
nnoremap <silent> <leader>C :Commits<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :Buffers<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :BLines<CR>
" Search in all the opened buffers [L]ines
nnoremap <silent> <leader>L :Lines<CR>
" Search in ultisnips [s]nippets
nnoremap <silent> <leader>s :Snippets<CR>
" Search in [m]arks
nnoremap <silent> <leader>m :Marks<CR>
" Search in edited files [h]istory
nnoremap <silent> <leader>h :History<CR>
" Search in search [/] history
nnoremap <silent> <leader>/ :History/<CR>
" Search in ag search
nnoremap <silent> <leader>a :Ag
"}}}

" -----------------------------------------------------
" 5.2 Ultisnips {{{
" -----------------------------------------------------
" Disable built-in cx-ck to be able to go backward
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"}}}

" -----------------------------------------------------
" 5.3 Isolate {{{
" -----------------------------------------------------
vnoremap ,i :Isolate<CR>
nnoremap ,u :UnIsolate<CR>
"}}}

" -----------------------------------------------------
" 5.4 Gitgutter {{{
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>
"}}}

" -----------------------------------------------------
" 5.5 Expand region {{{
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" -----------------------------------------------------
" 5.6 Vim Markdown {{{
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader
"}}}

" -----------------------------------------------------
" 5.7 Argumentative (use a instead of ,) {{{
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
" 5.8 Deoplete autocomplete {{{
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
"}}}

" -----------------------------------------------------
" 5.9 CtrlSF {{{
" -----------------------------------------------------
nnoremap <leader>g :CtrlSF<Space>
nnoremap <leader>G :CtrlSFToggle<Space>
"}}}

" -----------------------------------------------------
" 5.10 Vim-Plug {{{
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>
"}}}

" -----------------------------------------------------
" 5.11 Ctrl-SF {{{
" -----------------------------------------------------
let g:ctrlsf_mapping = {
      \ 'next'    : 'n',
      \ 'prev'    : 'N',
      \ 'quit'    : 'q',
      \ 'openb'   : '',
      \ 'split'   : 's',
      \ 'tab'     : '',
      \ 'tabb'    : '',
      \ 'popen'   : '',
      \ 'pquit'   : '',
      \ 'loclist' : '',
      \ }

nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>
"}}}

" -----------------------------------------------------
" 5.12 BufOnly -> [C]lose all {{{
" -----------------------------------------------------
nnoremap ,C :Bonly<CR>
"}}}

" -----------------------------------------------------
" 5.13 Tabularize -> [a]lign {{
" -----------------------------------------------------
vnoremap ,a :Tabularize /
"}}}

" -----------------------------------------------------
" 5.14 JsDoc {{
" -----------------------------------------------------
nnoremap ,d :JsDoc<CR>
"}}}

" -----------------------------------------------------
" 5.15 YankRing {{
" -----------------------------------------------------
nnoremap <silent> <leader>y :YRShow<CR>
"}}}

"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting {{{
syntax on
"}}}

" Color scheme {{{
set background=dark
colorscheme hybrid
"}}}

" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently {{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Remove underline in folded lines {{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors {{{
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

" Keywordprg settings {{{
augroup vim_man
  autocmd FileType vim setlocal keywordprg=:help
augroup END
"}}}

" Turn spellcheck on for markdown files {{{
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END
"}}}

" Remove trailing whitespaces automatically before save {{{
augroup strip_ws
  autocmd BufWritePre * call utils#stripTrailingWhitespaces()
augroup END
"}}}

" Resize splits when the window is resized {{{
augroup resize_improvements
  autocmd VimResized * :wincmd =
augroup END
"}}}

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh. {{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Keyboard layout switching {{{
if g:utils_autoswitch_kb_layout == 1
  augroup auto_kb_switch
    autocmd InsertEnter * call utils#setSKKBLayout()
    autocmd InsertLeave * call utils#setUSKBLayout()
  augroup END
end
"}}}

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
augroup prevent_q_colon
  autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END

" -----------------------------------------------------
" 7.1 Run linters after save {{{
" -----------------------------------------------------

augroup linters
  " npm install -g eslint
  autocmd BufWritePost *.js Neomake eslint
  " npm install -g jsonlint
  autocmd BufWritePost *.json Neomake jsonlint
  " npm install -g typescript
  autocmd BufWritePost *.ts Neomake tsc
  " gem install rubocop
  autocmd BufWritePost *.rb Neomake rubocop
  " sudo apt-get install elixir
  autocmd BufWritePost *.ex Neomake elixir
  " apt-get install tidy
  autocmd BufWritePost *.html Neomake tidy
  " gem install haml_lint
  autocmd BufWritePost *.haml Neomake hamllint
  " gem install scss-lint
  autocmd BufWritePost *.scss Neomake sasslint
  " gem install mdl
  autocmd BufWritePost *.md Neomake mdl
  " apt-get install shellcheck
  autocmd BufWritePost *.sh Neomake shellcheck
  " pip3 install vim-vint
  autocmd BufWritePost *.vim Neomake vint
augroup END
"}}}

"}}}

" ======================================================================================================================
" 8.0 Todo, Notes
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 8.1 Todo {{{
" -----------------------------------------------------
" 1. Update README file.
"}}}

" -----------------------------------------------------
" 8.2 Notes {{{
" -----------------------------------------------------
"}}}

"}}}
