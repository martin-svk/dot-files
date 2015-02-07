# Opiniated Ruby/Rails centric dotfiles.

Caution: This repository is changing constantly as my workflow is changing.
Below I present the most interesting parts of my config files. Feel free to
be inspired.

## What's included:

* Vim (Neovim)
* Ruby CLI utilities (pry, gem, irb)
* ZSH
* Tmux
* Git
* XTerm (Xresources)

## VIM / NEOVIM

I am currently switching between vim and [neovim](http://neovim.org/) and synchronizing my
rc files as well. Below are the most interesting parts of my vimrc file.

### Plugins

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)
Language/syntax files: [vim-polyglot](https://github.com/sheerun/vim-polyglot)

#### Autocomplete [(Supertab)](https://github.com/ervandew/supertab)

```VimL
let g:SuperTabDefaultCompletionType='context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif
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
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --ignore ".meteor"--hidden -g ""'
  let g:unite_source_file_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --ignore ".meteor" --hidden -g ""'
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

" Search in cwd files recursively ([o]pen)
nnoremap <silent> <leader>o :<C-u>Unite -no-split -buffer-name=project-files -start-insert file_rec/async:!<CR>
" [s]witch between open files (buffer)
nnoremap <silent> <leader>s :<C-u>Unite -no-split -buffer-name=buffers buffer<CR>
" Search in current file tags
nnoremap <silent> <leader>t :<C-u>Unite -no-split -buffer-name=tags -start-insert outline<CR>
" Simple file browse
nnoremap <silent> <leader>f :<C-u>Unite -no-split -buffer-name=files file<CR>
" Search for term in cwd file ([g]rep)
nnoremap <silent> <leader>g :<C-u>Unite -silent -auto-resize grep:.<CR>
" Search in edit [h]istory
nnoremap <silent> <leader>h :<C-u>Unite -buffer-name=edit-history -auto-resize change<CR>
" Search in [c]ommands
nnoremap <silent> <leader>c :<C-u>Unite -start-insert -auto-resize command<CR>
" Search in defined [m]appings
nnoremap <silent> <leader>m :<C-u>Unite -start-insert -auto-resize mapping<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :<C-u>Unite -no-split -buffer-name=line-search -start-insert line<CR>
" Search in [y]ank history
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yank-history -auto-resize history/yank<CR>
```

#### Snippets support [(Ultisnips)](https://github.com/SirVer/ultisnips)

```VimL
" Disable built-in cx-ck to be able to go backward in US
inoremap <c-x><c-k> <nop>
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
```

#### Fast text navigation [(Easymotion)](https://github.com/Lokaltog/vim-easymotion)

```VimL
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" [m]otion prefix
nmap m <Plug>(easymotion-prefix)

" Seek 2 character motion
nmap s <Plug>(easymotion-sl2)

" Improved search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
```

### Vim defaults improving

```VimL
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
```

### Screenshots

[Molokai + NERDTree + Unite](./images/vim.png)

## ZSH

ZSH config overview here!

## TMUX

Tmux config overview here!

## XTERM

Xterm overview here!

## PRY, GEM, IRB

Ruby CLI tools configs overview here!
