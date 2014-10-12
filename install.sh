#!/bin/bash

#-----------------------------------------------------
# @author Martin Toma
# @version 3.0
# @date Fri Nov 15 13:13:22 CET 2013
# @date of v2 Sat Aug  2 14:46:00 CEST 2014
# @date of v3 Sun Oct 12 17:07:31 CEST 2014
#-----------------------------------------------------

#-----------------------------------------------------
# Functions and variables
#-----------------------------------------------------
current_path=`pwd`

command_exists () {
  type "$1" &> /dev/null;
}

install_oh_my_zsh () {

}

#-----------------------------------------------------
# Bash and zsh installation
#-----------------------------------------------------
echo -n "[ bashrc ]"

if [ ! -f ~/.bashrc ]; then
  echo "    Creating!"
  ln -s $current_path/shell/bashrc ~/.bashrc
else
  echo "    Deleting old one!"
  rm ~/.bashrc
  ln -s $current_path/shell/bashrc ~/.bashrc
fi

echo -n "[ oh-my-zsh ]"

if command_exists zsh; then
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Oh my zsh is not installed, want to install now? [Y/n]"
    read answer
    if [ answer -eq "y" ]; then
      install_oh_my_zsh
    else
      echo "Not installing oh-my-zsh!"
    fi
  fi
else
  echo "ZSH is not installed, want to install now? [Y/n]"
  read answer
  if [ answer -eq "y" ]; then
    sudo apt-get install zsh &&
    install_oh_my_zsh
  else
    echo "Not installing zsh!"
  fi
fi

echo -n "[ zshrc ]"

if [ ! -f ~/.zshrc ]; then
  echo "    Creating!"
  ln -s $current_path/shell/zshrc ~/.zshrc
else
  echo "    Deleting old one!"
  rm ~/.zshrc
  ln -s $current_path/shell/zshrc ~/.zshrc
fi

#-----------------------------------------------------
# Git (config, ignore)
#-----------------------------------------------------
echo -n "[ gitconfig ]"

if [ ! -f ~/.gitconfig ]; then
  echo "    Creating!"
  ln -s $current_path/git/gitconfig ~/.gitconfig
else
  echo "    Deleting old one!"
  rm ~/.gitconfig
  ln -s $current_path/git/gitconfig ~/.gitconfig
fi

echo -n "[ gitignore ]"

if [ ! -f ~/.gitignore ]; then
  echo "    Creating!"
  ln -s $current_path/git/gitignore ~/.gitignore
else
  echo "    Deleting old one!"
  rm ~/.gitignore
  ln -s $current_path/git/gitignore ~/.gitignore
fi

#-----------------------------------------------------
# Vim, Neovim (vimrc, nvimrc, plugins)
#-----------------------------------------------------
echo -n "[ vimrc ]"

if [ ! -f ~/.vimrc ]; then
  echo "    Creating!"
  ln -s $current_path/vim/vimrc ~/.vimrc
else
  echo "    Deleting old one!"
  rm ~/.vimrc
  ln -s $current_path/vim/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
  curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#-----------------------------------------------------
# Installing tmux and tmuxinator
#-----------------------------------------------------
echo -n "[ tmux.conf ]"

if [ ! -f ~/.tmux.conf ]; then
  echo "    Creating!"
  ln -s $current_path/tmux/tmux.conf ~/.tmux.conf
else
  echo "    Deleting old one!"
  rm ~/.tmux.conf
  ln -s $current_path/tmux/tmux.conf ~/.tmux.conf
fi

echo -n "[ tmuxinator ]"

if command_exists gem; then
  if command_exists tmuxinator; then
    echo "    Already installed, adding rails template!"
    cp $current_path/tmux/tmuxinator-ror-template.yml ~/.tmuxinator/tmuxinator-ror-template.yml
  else
    echo "    Installing tmuxinator!"
    gem install tmuxinator &&
    cp $current_path/tmux/tmuxinator-ror-template.yml ~/.tmuxinator/tmuxinator-ror-template.yml
  fi
fi

#-----------------------------------------------------
# Installing Xresources
#-----------------------------------------------------
echo -n "[ Xresources ]"

if [ ! -f ~/.Xresources ]; then
  echo "   Creating!"
  ln -s $current_path/shell/Xresources ~/.Xresources
else
  echo "   Deleting old one!"
  rm ~/.Xresources
  ln -s $current_path/shell/Xresources ~/.Xresources
fi

#-----------------------------------------------------
# Installing ruby utilities
#-----------------------------------------------------
echo -n "[ Ruby utilities (gemrc, irbrc, rdebugrc) ]"

if command_exists ruby; then
  echo "   Creating!"
  ln -s $current_path/ruby/gemrc ~/.gemrc
  ln -s $current_path/ruby/irbrc ~/.irbrc
  ln -s $current_path/ruby/rdebugrc ~/.rdebugrc
  if command_exists pry; then
    ln -s $current_path/ruby/pryrc ~/.pryrc
  else
    echo "   Installing pry!"
    gem install pry &&
    ln -s $current_path/ruby/pryrc ~/.pryrc
  fi
else
  echo "    Aborting, ruby is not installed. Please install rbenv or rvm and rerun this script again."
fi
