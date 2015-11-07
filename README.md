# Opinionated Ruby/Rails centric dot-files.

**Caution**: This repository is changing constantly as my workflow is changing (hopefully improving).
Below I present the most interesting parts of my config files. Feel free to be inspired.

## What's included:

* NeoVim
* Tmux
* Git
* ZSH (oh-my-zsh)
* XTerm (Xresources)
* Ruby/Rails utilities (pry, gem, irb)
* Other CLI utilities (Ag search, Devilspie2)

## NEOVIM

I am using [neovim](http://neovim.org/) which is a vim fork focused on maintainability.
Below are the most interesting parts of my neovim configuration file.

### Plugins

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)
Language/syntax files: [vim-polyglot](https://github.com/sheerun/vim-polyglot)

### Neovim defaults overriding/improving

```viml
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

" Dont yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Dont copy overpasted text in visual mode
xnoremap p "_dP
```

#### Autocomplete (Simple tab wrapper + Ctags)

```VimL
" Multipurpose tab key (inspired by Gary Bernhardt)
inoremap <expr> <tab> utils#insertTabWrapper()
inoremap <s-tab> <C-n>

" Ctags settings
set tags+=.tags

" Generate tags definitions
command! GenerateCT :call utils#generateCtags()
command! GenerateJSCT :call utils#generateJSCtags()
command! GenerateRubyCT :call utils#generateRubyCtags()
```

#### Fuzzy file/buffer/text finder [(Unite)](https://github.com/Shougo/unite.vim)

```VimL
" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Track yank history
let g:unite_source_history_yank_enable=1

" Use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C0'
  let g:unite_source_grep_recursive_opt=''

  " Set rec source command
  let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup',
        \  '--ignore', '.git', '--ignore', '.hg', '--ignore', '.svn', '--ignore', '.bzr',
        \  '--ignore', '.meteor', '--ignore', '**/bower_components/', '--ignore', '**/node_modules/',
        \  '--hidden', '-g', '']
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
```

#### Snippets support [(Ultisnips)](https://github.com/SirVer/ultisnips)

```VimL
" Disable built-in cx-ck to be able to go backward
inoremap <C-x><C-k> <nop>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
```

### Color settings based on time

```viml
syntax on

" XTerm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
  set t_Co=256
endif

" Color scheme based on time
if strftime("%H") < 14
  let g:airline_theme='badwolf'
  let g:badfox_html_link_underline=0
  colorscheme badfox
elseif strftime("%H") < 20
  let g:rehash256 = 1
  let g:airline_theme='tomorrow'
  colorscheme molokai
else
  set bg=dark
  let g:airline_theme='tomorrow'
  colorscheme hybrid
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

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

And setting some options to improve behavior to my taste.

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
quickly bootstrap tmux sessions. Below are the most interesting settings in my tmux config file:

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
My terminal emulator of choice. Below are some interesting settings I use:

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

Require rubygems in *irbrc* to have access while in IRB session (I recommend using Pry):

```ruby
require 'rubygems'
```

## AG, DEVILSPIE2

[Ag](http://geoff.greer.fm/ag/) is a popular and blazingly fast find on steroids optimized for developers.
I recommend to create *agignore* to specify extra path to ignore. While Ag is pretty intelligent most of things
are already ignored.

```bash
*.log
tmp/*
```

[Devilspie2](http://www.gusnan.se/devilspie2/) is a window matching utility, allowing the user to perform
scripted actions on windows as they are created. I use it mainly to move application to their reserved
workspace and to make them go fullscreen automatically.

Below is an example of such script:

```lua
-- XTerm
if (get_application_name()=="xterm") then
  set_window_workspace(2);
  maximize();
end
```
