" ######################################################################################################################
" ### Author : Martin Toma <martin.toma.svk@gmail.com>                                                               ###
" ######################################################################################################################
" ### Wasavi Configuration
" ### Date created : Fri Nov 13 10:36:17 CET 2015
" ######################################################################################################################

" ======================================================================================================================
" 1.0 Basic settings
" ======================================================================================================================
"{{{

set number                                  " Show line numbers
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set textwidth=120                           " Text width is 120 chars
set history=1024                            " Number of things to remember in history
set magic                                   " For regular expressions turn magic on
set showmatch                               " Show matching brackets when text indicator is over them
set wrapscan                                " Search again from top when reached the bottom
set showmode                                " Show current mode

" -----------------------------------------------------
" 1.1 Intendation settings (2 spaces tabs)
" -----------------------------------------------------
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

" -----------------------------------------------------
" 1.2 Wasavi specific
" -----------------------------------------------------
set nocursorblink
"}}}

" ======================================================================================================================
" 2.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 2.1 Disabling arrow keys, space key, exmode enter
" with Q key, help with F1, etc.
" -----------------------------------------------------
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <bs> <nop>
map <delete> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <Space> <nop>
map <F1> <nop>
map <F1> <nop>
map Q <nop>

" -----------------------------------------------------
" 2.2 Vim defaults overriding
" -----------------------------------------------------

" Visual linewise up and down by default
map j gj
map k gk

" When jump to next match also center screen
map n nzz
map N Nzz

" Same when moving up and down
map <c-d> <c-d>zz
map <c-u> <c-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
map H ^
map L $

" More logical Y (defaul was alias for yy)
map Y y$

" Quick replay q macro
map Q @q

" -----------------------------------------------------
" 2.3 Common tasks
" -----------------------------------------------------

" Quick save and quit / delete buffers intelligently
map ,w :w<CR>
map ,d :q<CR>

" Yank and paste from clipboard
map ,y "+y
map ,yy "+yy
map ,p "+p
"}}}
