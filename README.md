# Opinionated Ruby/Rails centric dot-files.

**Caution**: This repository is changing constantly as my workflow is changing (hopefully improving).
Below I present the most interesting parts of my config files. Feel free to be inspired.

## What's included:

* NeoVim (Vim/GVim)
* ZSH (oh-my-zsh)
* Tmux
* Git
* XTerm (Xresources)
* Ruby/Rails utilities (pry, gem, irb)
* Other CLI utilities (Ag search, Xmodmap, Devilspie2)

## NEOVIM / VIM

I am currently switching between [neovim](http://neovim.org/) and vim (gvim) and synchronizing my
rc files as well. Below are the most interesting parts of my [n]vimrc file.

### Plugins

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)
Language/syntax files: [vim-polyglot](https://github.com/sheerun/vim-polyglot)

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

I am using the excellent [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

```zsh
# Plugins from oh-my-zsh
plugins=(adb bgnotify bower bundler coffee colored-man common-aliases docker extract gitfast
        gem httpie jsontools meteor rails rbenv rsync tmux tmuxinator vagrant zsh-syntax-highlighting)


# History substring plugin
source $ZSH/plugins/history-substring-search/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
```

And setting some options to improve behaviour to my taste.

```zsh
# Disable control flow (ctrl-s / ctrl-q)
stty stop '' -ixoff -ixon

# Set spelling correction
setopt correct

# Dont raise errors when regex nomatch fires
unsetopt nomatch
```

## TMUX

I am heavy user of tmux and I am using the excellent [tmuxinator](https://github.com/tmuxinator/tmuxinator) gem to
quickly boostrap tmux sessions. Below are the most interesting settings in my tmux config file:

```zsh
# Ctrl-b instead of Ctrl-a
set -g prefix C-b

# Unset ruby version so it respects .ruby-version files
set-environment -gu RBENV_VERSION

# For nice colors
set -g default-terminal "screen-256color"

# XTerm compatibility
setw -g xterm-keys on

# Vi keys in copy mode
setw -g mode-keys vi

# Fastest command sequences
set -s escape-time 0

# UTF-8 settings
set -g status-utf8 on
setw -g utf8 on

# History boost
set -g history-limit 5000
```

## GIT

What about git config? Maybe some useful aliases:

```git
[alias]
  a = add --all
  d = difftool --no-prompt
  di = diff --staged
  co = checkout
  pl = pull
  ps = push
  st = status -sb
  ci = commit
  br = branch
  lo = log --oneline -n 15
  lg = log --pretty=format:'%h | %cd | %an | %s' -n 15
  ls = log --stat -n 5
  g1 = log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%cr)%C(reset) %C(white)%s%C(reset) %C(bold white)— %cn%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative
  g2 = log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%cD%C(reset) %C(bold green)(%cr)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(bold white)— %cn%C(reset)' --abbrev-commit
  lol = log --oneline --graph --all --decorate
  unstage = reset HEAD --
  last = log -1 HEAD
  rb = rebase -i HEAD~10
  wc = whatchanged -p --abbrev-commit --pretty=medium
```

## XTERM
My terminal emulator of choice. I use [dynamic-colors](https://github.com/sos4nt/dynamic-colors) to switch colors
on the fly. Below are some interesting settings I use:

```zsh
! Unicode support
xterm*utf8: 1

! Color support
xterm*customization: -color
xterm*termName: xterm-256color

! For inclusion of all necessary environment variables
xterm*loginShell: true

! Scrollback setting
xterm*savelines: 10000

! Disable right scrollbar
xterm*ScrollBar: false

! Stop output to terminal from jumping down to bottom of scroll again
xterm*scrollTtyOutput: false

! Dynamic colors
xterm*dynamicColors: true
```

## PRY, GEM, IRB

Don't install RI docs when installing gems (put into your gemrc):

```bash
gem: --no-ri --no-rdoc
```

Use editor to edit bigger blocks of code when in pry (put into your pryrc):

```bash
# === EDITOR ===
Pry.config.editor = 'nvim'
```

Require rubygems in *irbrc* to have access while in IRB session (i recommend using Pry):

```ruby
require 'rubygems'
```

## AG, DEVILSPIE2

[Ag](http://geoff.greer.fm/ag/) is a popular and blazingly fast find on streoids optimized for developers.
I recommend to create *agignore* to specify extra path to ignore. While Ag is pretty intelligent most of things
are already ignored.

```bash
*.log
tmp/*
```

[Devilspie2](http://www.gusnan.se/devilspie2/) is a window matching utility, allowing the user to perform
scripted actions on windows as they are created. I use it maily to move application to their reserved
workspace and to make them fullscreeen.

Below is an example of such script:

```lua
-- XTerm
if (get_application_name()=="xterm") then
  set_window_workspace(2);
  maximize();
end
```
