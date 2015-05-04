# Opiniated Ruby/Rails centric dotfiles.

Caution: This repository is changing constantly as my workflow is changing.
Below I present the most interesting parts of my config files. Feel free to
be inspired.

## What's included:

* NeoVim (Vim/GVim)
* Ruby/Rails utilities (pry, gem, irb)
* ZSH (oh-my-zsh)
* Tmux
* Git
* XTerm (Xresources)
* Other CLI utilities (Ag search, Xmodmap, Devilspie2)

## NEOVIM / VIM

I am currently switching between [neovim](http://neovim.org/) and vim (gvim) and synchronizing my
rc files as well. Below are the most interesting parts of my [n]vimrc file.

### Plugins

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)
Language/syntax files: [vim-polyglot](https://github.com/sheerun/vim-polyglot)

#### Autocomplete [(Supertab)](https://github.com/ervandew/supertab)

```VimL
" Use context mode
let g:SuperTabDefaultCompletionType='context'
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

" Omni complete function settings
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType tex set omnifunc=LatexBox_Complete

" Use omni-complete where available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ else |
        \   let g:SuperTabContextDefaultCompletionType='<c-x><c-u>' |
        \ endif
endif
```

#### Fuzzy file/buffer/text finder [(Unite)](https://github.com/Shougo/unite.vim)

```VimL
" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')

" Track yank history
let g:unite_source_history_yank_enable=1

" Use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C0'
  let g:unite_source_grep_recursive_opt=''
  " Ignore vcs files
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore
        \ ".bzr" --ignore ".meteor"--hidden -g ""'
  let g:unite_source_file_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore
        \ ".bzr" --ignore ".meteor" --hidden -g ""'
endif

" Ignore wildignore files
call unite#custom#source('file_rec', 'ignore_globs', split(&wildignore, ','))

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
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

" [U]nite menu
nnoremap <silent> <leader>u :Unite -start-insert source<CR>
" [O]pen files recursively
nnoremap <silent> <leader>o :Unite -no-split -buffer-name=project-files -start-insert file_rec/async:!<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :Unite -no-split -buffer-name=buffers buffer<CR>
" Search in current file tags
nnoremap <silent> <leader>t :Unite -no-split -buffer-name=tags -start-insert outline<CR>
" Search for term in cwd file ([g]rep)
nnoremap <silent> <leader>g :Unite -silent grep:.<CR>
" Search in edit [h]istory
nnoremap <silent> <leader>h :Unite -buffer-name=edit-history change<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :Unite -no-split -buffer-name=line-search -start-insert line<CR>
" Search in [y]ank history
nnoremap <silent> <leader>y :Unite -buffer-name=yank-history history/yank<CR>
" Search in [r]egisters
nnoremap <silent> <leader>r :Unite -buffer-name=registers register<CR>
" Search in opened [w]indow splits
nnoremap <silent> <leader>w :Unite -no-split -buffer-name=splits window<CR>
```

#### Snippets support [(Ultisnips)](https://github.com/SirVer/ultisnips)

```VimL
" Disable built-in cx-ck to be able to go backward
inoremap <c-x><c-k> <nop>
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
```

#### Fast text navigation [(Easymotion)](https://github.com/Lokaltog/vim-easymotion)

```VimL
" Turn on case sensitive feature
let g:EasyMotion_smartcase=1

" [m]otion prefix
nmap m <Plug>(easymotion-prefix)

" Seek 2 character motion
nmap s <Plug>(easymotion-sl2)

" Improved search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
```

### [Neo]Vim defaults improving

```viml
" Intelligent window cycling (ignore NERDTree, TagBar, etc. buffers)
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>

" Visual linewise up and down by default
noremap j gj
noremap k gk

" When jump to next match also center screen
noremap n nzz
noremap N Nzz

" Same when moving up and down
noremap <c-d> <c-d>zz
noremap <c-u> <c-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" More logical Y (defaul was alias for yy)
nnoremap Y y$

" Quick replay q macro
nnoremap Q @q

" Mark with big M (default to middle of the screen overriden)
" m is used as EasyMotion leader key
nnoremap M m

" Cancel neovim terminal mode with escape
tnoremap <ESC> <c-\><c-n>
```

### Color settings based on time

```viml
" Syntax highlighting
syntax on

" XTerm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
  set t_Co=256
endif

" Color scheme based on time
if strftime("%H") < 15
  let g:rehash256 = 1
  let g:airline_theme='tomorrow'
  colorscheme molokai
elseif strftime("%H") < 20
  let g:airline_theme='tomorrow'
  colorscheme hybrid
else
  let g:airline_theme='gotham'
  colorscheme gotham
endif

" Remove underline in folded lines
hi Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
```

### Screenshot and Cheatsheets

[Molokai + NERDTree + Unite](./images/vim.png)

[Vim-hybrid + NERDTree + Tagbar](./images/vim_hybrid.png)

[Gotham + NERDTree + Tagbar](./images/vim_gotham.png)

[Image cheatsheet](./images/cheatsheet.png)

[PDF cheatsheet](./images/cheatsheet2.pdf)

## ZSH

ZSH config overview here!

## TMUX

Tmux config overview here!

## XTERM

Xterm overview here!

## PRY, GEM, IRB

Ruby CLI tools configs overview here!
