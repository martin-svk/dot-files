# Well documented, terminal centric web developer's dot files

Hey everybody. I am Martin, a software developer with an obsession for workflow improvement.
Below I present the most interesting parts of my config files. **Feel free to be inspired**.

**Caution**: This repository is changing often as my workflow is changing (and hopefully improving).

| [Credits](#credits) | [License](#license) |

## What's included

* [Neovim](#neovim) ([source](./neovim/init.vim))
* [ZSH](#zsh) ([source](./shell/zshrc))
* [Tmux](#tmux) ([source](./tmux/tmux.conf))
* [Git](#git) ([source](./git/gitconfig))
* [Xterm](#xterm) ([source](./shell/Xresources))
* [Ruby utilities (pry, gem, IRB)](#pry-gem-irb)
* [Other utilities (Ag search, Devilspie2)](#ag-devilspie2)

## Neovim

I am using [Neovim](http://neovim.org/) which is a **Vim** fork focused on maintainability.
Below are the most interesting parts of my Neovim configuration.

### Show me the end result first

Here you go.

![Neovim + Tender](./data/screenshots/tender.png)

Want more? Scroll down to the appropriate [section](#screenshots-and-cheatsheets).

### Plugins

I use the excellent [vim-plug](https://github.com/junegunn/vim-plug) package manager.
It supports parallel fetching, lazy loading, after install hooks, etc. You should consider using it :)

And which plugins I use? Currently I use about **75** plugins. Some of the most interesting are:

* [Neomake](https://github.com/benekastah/neomake) - Linter integration (Syntastic alternative) with asynchronous support.
* [Unite](https://github.com/Shougo/unite.vim) - Search and display information from arbitrary sources.
* [Deoplete](https://github.com/Shougo/deoplete.nvim) - Autocomplete with Neovim asynchronous support.
* [Lightline](https://github.com/itchyny/lightline.vim) - Lightweight but extensible and configurable status line.
* [Lexima](https://github.com/cohama/lexima.vim) - Auto-closing (,",' and some language constructs (ruby blocks). Dot repeat supported.

For a complete list, look [here](./neovim/init.vim#L24).

### Utility scripts

In the code snippets below I ofter call `utils#xxx()` functions. Those are just simple multiple lines long
vimscript functions (often inspired by other people). You can find them [here](./neovim/autoload/utils.vim).

### Vim defaults overriding (improving)

```VimL
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

" More logical Y (default was alias for yy)
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

" Use camel-case motion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default Vim has special treatment (:help cw)
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

" Cancel terminal mode with ,escape
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz
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

" Ctags navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>

" Quick-fix window navigation
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

" Split line (sister to Join lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>
```

### Buffer management

```VimL
" Intelligent windows resizing using Ctrl + arrow keys
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
```

### Autocomplete (Deoplete + Ctags)

```VimL
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=2

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']

" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete previous char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
```

### Browser and fuzzy searcher for multiple sources ([Unite](https://github.com/Shougo/unite.vim))

```VimL
" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Use Ag if available
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

" Don't override status line
let g:unite_force_overwrite_statusline=0
```

#### Unite buffer mappings

```VimL
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with <C-j> and <C-k> in insert mode
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

### Improved status line ([Lightline](https://github.com/itchyny/lightline.vim))

```VimL
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
```

### Snippets support ([UltiSnips](https://github.com/SirVer/ultisnips))

```VimL
" Disable built-in <C-x><C-k> to be able to go backward
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
```

### Color settings based on time

```viml
" Syntax highlighting
syntax on

" Color scheme based on time
if strftime("%H") < 16
  let g:rehash256 = 1
  colorscheme molokai
else
  colorscheme jellybeans
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Remove underline in folded lines
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" List chars highlighting
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray

" Link highlight groups to improve buffer tab line colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
```

### Screenshots and Cheatsheets

[Iceberg](./data/screenshots/iceberg.png)

[Hybrid](./data/screenshots/hybrid.png)

[Image cheatsheet](./data/cheatsheet.png)

[PDF cheatsheet](./data/cheatsheet2.pdf)

## Zsh

My shell interpreter of choice. Here are some options to improve the behavior to my taste.

```zsh
# Disable control flow (<C-s> / <C-q>)
stty stop '' -ixoff -ixon

# Set spelling correction
setopt correct

# Don't raise errors when regex nomatch fires
unsetopt nomatch
```

I am also using the excellent [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework.

```zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="martinus"

# Disable auto title setting
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(adb bgnotify bower bundler common-aliases docker extract gem gitfast gulp heroku httpie jsontools meteor mix
         npm rails rbenv redis-cli rsync tmux tmuxinator vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

# History substring search plugin binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
```

## Tmux

I am a heavy user of tmux. I am using the [tpm](https://github.com/tmux-plugins/tpm) package manager
and mainly it's [tmux resurrect](https://github.com/tmux-plugins/tmux-resurrect) plugin which allows me
to persist sessions on the disk.

I am also using the [tmuxinator](https://github.com/tmuxinator/tmuxinator) gem to
quickly bootstrap new tmux sessions. Below are the most interesting settings in my tmux config file:

### Settings

```tmux
# Unset ruby version so it respects .ruby-version files
set-environment -gu RBENV_VERSION

# UTF-8 settings
set -g status-utf8 on
set -g utf8 on

# Fastest command sequences (http://superuser.com/a/252717/65504)
set -s escape-time 0

# For nice colors
set -g default-terminal "screen-256color"

# XTerm compatibility
set -g xterm-keys on

# Vi keys in copy mode
set -g mode-keys vi

# History boost
set -g history-limit 50000

# Enable mouse
set -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# Emacs key bindings in command prompt (prefix + :) are better than vi keys, even for vim users
set -g status-keys emacs

# Focus events enabled for terminals that support them
set -g focus-events on

# Super useful when using "grouped sessions" and multi-monitor setup
setw -g aggressive-resize on

# Messages are displayed for 3 seconds
set -g display-time 3000
```

### Key bindings

```tmux
# Backtick as Prefix
unbind C-b
set -g prefix `
bind-key ` send-prefix

# Reload the file with Prefix r
bind R source-file ~/.tmux.conf \; display "Sourced tmux.conf"

# Next and prev window like in vim
bind -r - previous-window
bind -r = next-window

# New windows and panes in the same dir
bind-key n new-window -c "#{pane_current_path}"
bind-key i split-window -h -c "#{pane_current_path}"
bind-key v split-window -c "#{pane_current_path}"

# Pane switching
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
bind-key \ select-pane -l

# Resize panes with arrows
bind-key -r Left resize-pane -L 1
bind-key -r Down resize-pane -D 1
bind-key -r Up resize-pane -U 1
bind-key -r Right resize-pane -R 1

# <prefix> r to rename window
bind-key r command-prompt 'rename-window %%'

# <prefix> p to paste buffer
unbind p
bind p paste-buffer

# <prefix> P to choose which buffer to paste
bind P choose-buffer
```

### Plugins

```zsh
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-yank' # yanking helpers
set -g @plugin 'tmux-plugins/tmux-sessionist' # session helpers prefix + C (new session)
set -g @plugin 'tmux-plugins/tmux-resurrect' # prefix + <C-s> save, <C-r> restore
set -g @plugin 'tmux-plugins/tmux-battery' # Batter percentage
set -g @plugin 'tmux-plugins/tmux-online-status' # Online status

# Initialize plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

## Git

What about my git config? Maybe some useful aliases:

```git
[alias]
  a = add
  aa = add --all
  di = diff
  ds = diff --staged
  dt = difftool --no-prompt
  ci = commit --verbose
  amend = commit --amend --verbose
  co = checkout
  pl = pull
  ps = push
  pom = push origin master
  pod = push origin develop
  rb = rebase -i HEAD~10
  st = status -sb
  br = branch
  lo = log --oneline -n 15
  lg = log --pretty=format:'%h | %cd | %an | %s' -n 15
  ls = log --stat -n 5
  lol = log --oneline --graph --all --decorate
  g1 = log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%cr)%C(reset) %C(white)%s%C(reset) %C(bold white)— %cn%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative
  g2 = log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%cD%C(reset) %C(bold green)(%cr)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(bold white)— %cn%C(reset)' --abbrev-commit
  wc = whatchanged -p --abbrev-commit --pretty=medium
  unstage = reset HEAD --
  edit = "!nvim `git ls-files -m`"
```

## Xterm

My terminal emulator of choice. Below are some interesting settings I use:

```xdefaults
! Unicode support
xterm*utf8: 1

! Color support
xterm*customization: -color
xterm*termName: xterm-256color

! Font settings
xterm*faceName: Droid Sans Mono for Powerline:Bold
xterm*faceSize: 9
xterm*allowBoldFonts: false

! For inclusion of all necessary environment variables
xterm*loginShell: true

! Scrollback setting
xterm*savelines: 10000

! Disable right scrollbar
xterm*ScrollBar: false

! Stop output to terminal from jumping down to bottom of scroll again
xterm*scrollTtyOutput: false

! Save selections to clipboard
xterm*selectToClipboard: true
```

## Pry, Gem, IRB

Don't install RI docs when installing gems (put into your gemrc):

```bash
gem: --no-ri --no-rdoc
```

Use editor to edit bigger blocks of code when in pry (put into your pryrc):

```bash
# === EDITOR ===
Pry.config.editor = 'nvim'
```

Require Rubygems in *irbrc* to have access while in IRB session (I recommend using Pry):

```ruby
require 'rubygems'
```

## Ag, Devilspie2

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

# Credits

Very big portion of these configuration files was inspired and often even copied
from other people, plugin authors, blog writers, etc. I want to say **Thank You** to all of them.

Especially, I want to mention these guys:

* [tpope](https://github.com/tpope)
* [garybernhardt](https://github.com/garybernhardt)
* [Shougo](https://github.com/Shougo)

For their contribution to Vim and Neovim ecosystem. Speaking of [Neovim](https://github.com/neovim/neovim),
the whole [team](https://github.com/neovim/neovim/graphs/contributors) should be mentioned for their great work.

# License

Well documented, terminal centric web developer's dot files.
Copyright (C) Martin Toma

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
