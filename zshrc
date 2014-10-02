# =====================================================================================================================
# General zsh settings
# =====================================================================================================================

# Disable control flow (ctrl-s / ctrl-q)
stty stop '' -ixoff -ixon

# =====================================================================================================================
# Oh my zsh settings
# =====================================================================================================================

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="martinus"

# Disable auto title setting
DISABLE_AUTO_TITLE="true"

# =====================================================================================================================
# Plugins declaration
# =====================================================================================================================

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(bundler colored-man gitfast gem npm rake-fast rails ruby rbenv tmux tmuxinator zsh-syntax-highlighting)

# =====================================================================================================================
# Sourcing
# =====================================================================================================================
source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

# =====================================================================================================================
# Plugin bindings
# =====================================================================================================================

# History substring search plugin binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# =====================================================================================================================
# Aliases
# =====================================================================================================================

# Navigation
alias ..='cd ..'                          # Go up one directory
alias ...='cd ../..'                      # Go up two directories
alias ....='cd ../../..'                  # Go up three directories
alias cdd='cd -'                          # Go back where you were

# Files and directories
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias md='mkdir -p'
alias rd='rmdir'

# APT-GET
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'
alias autoremove='sudo apt-get autoremove'

# Services
alias ss='sudo service'
alias ssmysql='sudo service mysql start'
alias sspgsql='sudo service postgresql start'
alias ssredis='sudo service redis-server start'

# Applications
alias g='git'
alias v='vim'
alias n='nvim'
alias e='emacs -nw'
alias rb='ruby'
alias msql='mysql -uroot -p'

# Android development
alias acp='android create project -n ExampleApp -t 1 -p . -k com.example -a MainActivity'

# SSH servers
alias s-pinta='ssh team11@calculon.fiit.stuba.sk -p 30022'
alias s-nitrous='ssh action@euw1-2.nitrousbox.com -p 21326'

# Other
alias q='exit'
alias capless='xmodmap /home/martin/config/dot-files/Xmodmap'
alias topdu='du -a | sort -nr | head -50'

# =====================================================================================================================
# Other exports
# =====================================================================================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add android sdk to path if it exists
if [ -d $HOME/lib/android-sdk-linux ]; then
  export PATH=$HOME/lib/android-sdk-linux/tools:$PATH
  export ANDROID_HOME='~/lib/android-sdk-linux'
  if [ -d $HOME/lib/android-sdk-linux/platform-tools ]; then
    export PATH=$HOME/lib/android-sdk-linux/platform-tools:$PATH
  fi
fi

export EDITOR='vim'
