if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias l='ls'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# Martin's aliases
alias cdd='cd -'
alias ss='sudo service'
alias ssmysql='sudo service mysql start'
alias sspgsql='sudo service postgresql start'
alias R='R --quiet'
alias g='git'
alias be='bundle exec'
alias r='rails'
alias v='vim'
alias p='pwd'
alias rv='ruby -v'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'
alias autoremove='sudo apt-get autoremove'

# ssh servers
alias s-pinta='ssh team11@calculon.fiit.stuba.sk -p 30022'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Autocd to directory
shopt -s autocd

# vim default editor
export EDITOR="vim"

# Addings to PATH
PATH=$PATH:/home/martin/.gem/ruby/2.0.0/bin
export PATH

# Custom bash prompt
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo " [${BRANCH}]"
	else
		echo ""
	fi
}

# get ruby version
function get_ror_version {
  echo -n $(ruby -v | cut -d ' ' -f 2)
  echo -n " => "
  echo -n $(rails -v | cut -d ' ' -f 2)
}

# Create custom prompt lines
#export PS1="\[\e[36m\]\u\[\e[m\] in \[\e[36m\]\w\[\e[m\] on \[\e[36m\]\`parse_git_branch\`\[\e[m\] riding \[\e[36m\][\$(get_ror_version)]\[\e[m\] \$ "
#export PS1="\[\e[36m\]\u\[\e[m\] in \[\e[36m\]\w\[\e[m\] on \[\e[36m\]\`parse_git_branch\`\[\e[m\] \$ "
#export PS1="\[\e[36m\]\u\[\e[m\] in \[\e[36m\]\w\[\e[m\] \$ "
export PS1="\[\e[36m\]\w\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\] \$ "
#export PS1="\$ "

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# RVM Init
# RVM bash completion
[[ -r /usr/local/rvm/scripts/completion ]] && . /usr/local/rvm/scripts/completion
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Disable CTRL-S / CTRL-Q
stty ixany
stty ixoff -ixon

# Tmuxinator autocompletion
if [ -f ~/bin/tmuxinator.bash ]; then
  source ~/.bin/tmuxinator.bash
fi
