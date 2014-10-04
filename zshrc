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
plugins=(bower bundler coffee colorize colored-man common-aliases debian extract gitfast
  git-extras gem npm rake-fast rails ruby rbenv systemd tmux tmuxinator zsh-syntax-highlighting)

# =====================================================================================================================
# Plugins settings
# =====================================================================================================================
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false

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

# Navigation, file and directories...
# From common-aliases
# TODO: Add them as docu here

# APT-GET
# From debian plugin
# TODO: Add them as docu here

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
