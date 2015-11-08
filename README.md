# Well documented, terminal centric web developer's dot files.

Hey everybody. I am Martin, a software developer with an obsession for workflow improvement.
Below I present the most interesting parts of my config files. **Feel free to be inspired**.

P.S. **Caution**: This repository is changing often as my workflow is changing (and hopefully improving).

## What's included?

* Neovim
* ZSH (oh-my-zsh)
* Tmux
* Git
* Xterm (Xresources)
* Ruby / Rails utilities (pry, gem, IRB)
* Other utilities (Ag search, Devilspie2)

## Neovim

I am using [neovim](http://neovim.org/) which is a Vim fork focused on maintainability.
Below are the most interesting parts of my Neovim configuration.

### Show me the end result first!

Here you go.

![Neovim + Jellybeans](./data/screenshots/jellybeans.png)

Want more? Scroll down to the appropriate [section](#screenshots-and-cheatsheets).

### Plugins

I use the excellent [vim-plug](https://github.com/junegunn/vim-plug) package manager.
It supports parallel fetching, lazy loading, after install hooks, etc. You should consider using it :)

And which plugins I use? Currently I use about 60 plugins. Some of the most interesting and not
so widely known are:

* [Neomake](https://github.com/benekastah/neomake) - Linter integration (Syntastic alternative) with asynchronous support.
* [Lexima](https://github.com/cohama/lexima.vim) - Auto-closing (,",' and some language constructs (ruby blocks). Dot repeat supported.
* [Unite](https://github.com/Shougo/unite.vim) - Search and display information from arbitrary sources.
* [Multiple cursors](https://github.com/terryma/vim-multiple-cursors) - ST inspired multiple cursors.
* [Isolate](https://github.com/ferranpm/vim-isolate) - Safely edit in isolation.

For complete list, look [here](https://github.com/martin-svk/dot-files/blob/master/neovim/init.vim#L17).

### Utility scripts

In the code snippets below I ofter call `utils#xxx()` namespaced functions. Those are some
simple multiple lines long vimscript functions. You can look find them [here](./neovim/scripts/utils.vim).

### Vim defaults overriding (improving)

```viml
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
inoremap <C-x><C-]> <C-]>

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
```

### Common tasks

```VimL
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
```

### Buffer management

```VimL
" Windows resizing using arrow keys
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
```

### Autocomplete (Simple tab wrapper + Ctags)

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

### Browser and fuzzy searcher for multiple sources [(Unite)](https://github.com/Shougo/unite.vim)

```VimL
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
```

#### Custom Unite menu (for when You forgot the shortcuts).

```
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
```

### Unite buffer mappings

```VimL
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
```

### Improved status line [(Lightline)](https://github.com/itchyny/lightline.vim)

```VimL
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
```

### Snippets support [(Ultisnips)](https://github.com/SirVer/ultisnips)

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
" Syntax highlighting
syntax on

" XTerm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
  set t_Co=256
endif

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
```

### Screenshots and Cheatsheets

[Iceberg + ReactJS](./data/screenshots/iceberg_react.png)

[Jellybeans + Unite file search](./data/screenshots/jellybeans_unite_file_search.png)

[Jellybeans + Unite line search](./data/screenshots/jellybeans_unite_line_filter.png)

[Jellybeans + Unite yank history](./data/screenshots/jellybeans_unite_yank_history.png)

[Image cheatsheet](./data/screenshots/cheatsheet.png)

[PDF cheatsheet](./data/screenshots/cheatsheet2.pdf)

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
workspace and to make them go full screen automatically.

Below is an example of such script:

```lua
-- XTerm
if (get_application_name()=="xterm") then
  set_window_workspace(2);
  maximize();
end
```
