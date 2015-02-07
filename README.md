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

Most important plugins:

- Language / syntax files [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- Autocomplete [supertab](https://github.com/ervandew/supertab) | my settings
  [here](https://github.com/martin-svk/dot-files/blob/master/vim/vimrc#L531)
- Fuzzy file/buffer/text finder [unite](https://github.com/Shougo/unite.vim) | my settings
  [here](https://github.com/martin-svk/dot-files/blob/master/vim/vimrc#L464)
- Snippets support [ultisnips](https://github.com/SirVer/ultisnips) | my settings
  [here](https://github.com/martin-svk/dot-files/blob/master/vim/vimrc#L636)
- Fast text navigation [easymotion](https://github.com/Lokaltog/vim-easymotion) | my settings
  [here](https://github.com/martin-svk/dot-files/blob/master/vim/vimrc#L636)

### Vim defaults overridings

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

" Mark with big M (default to middle of the screen overriden)
" m is used as EasyMotion leader
nnoremap M m
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
