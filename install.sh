#!/bin/bash

#-----------------------------------------------------
# @author Martin Toma
# @version 2.0
# @date Fri Nov 15 13:13:22 CET 2013
# @date of v2 Sat Aug  2 14:46:00 CEST 2014
#-----------------------------------------------------

#-----------------------------------------------------
# Functions and variables
#-----------------------------------------------------
current_path=`pwd`

command_exists () {
  type "$1" &> /dev/null ;
}


#-----------------------------------------------------
# Bash and zsh installation
#-----------------------------------------------------
echo -n "[ bashrc ]"

if [ ! -f ~/.bashrc ]; then
  echo "    Creating!"
  ln -s $current_path/bashrc ~/.bashrc
else
  echo "    Deleting old one!"
  rm ~/.bashrc
  ln -s $current_path/bashrc ~/.bashrc
fi

echo -n "[ zsh ]"
# TODO: Finish zsh setup
if command_exists zsh; then
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Oh my zsh is not installed, want to install now? [Y/n]"
  fi
else
  echo "Z-Shell is not installed, want to install now? [Y/n]"
fi

echo -n "[ zshrc ]"

if [ ! -f ~/.zshrc ]; then
  echo "    Creating!"
  ln -s $current_path/zshrc ~/.zshrc
else
  echo "    Deleting old one!"
  rm ~/.zshrc
  ln -s $current_path/zshrc ~/.zshrc
fi
#-----------------------------------------------------
# Git (config, ignore)
#-----------------------------------------------------
echo -n "[ gitconfig ]"

if [ ! -f ~/.gitconfig ]; then
  echo "    Creating!"
  ln -s $current_path/gitconfig ~/.gitconfig
else
  echo "    Deleting old one!"
  rm ~/.gitconfig
  ln -s $current_path/gitconfig ~/.gitconfig
fi

#-----------------------------------------------------
# Vim, (vimrc, plugins, spelling dictionary)
#-----------------------------------------------------
echo -n "[ vimrc ]"

if [ ! -f ~/.vimrc ]; then
  echo "    Creating!"
  ln -s $current_path/vimrc ~/.vimrc
else
  echo "    Deleting old one!"
  rm ~/.vimrc
  ln -s $current_path/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#-----------------------------------------------------
# Installing tmux and tmuxinator
#-----------------------------------------------------
echo -n "[ tmux.conf ]"

if [ ! -f ~/.tmux.conf ]; then
  echo "    Creating!"
  ln -s $current_path/tmux.conf ~/.tmux.conf
else
  echo "    Deleting old one!"
  rm ~/.tmux.conf
  ln -s $current_path/tmux.conf ~/.tmux.conf
fi

#-----------------------------------------------------
# Installing Xresources
#-----------------------------------------------------
echo -n "[ Xresources ]"

if [ ! -f ~/.Xresources ]; then
  echo "   Creating!"
  ln -s $current_path/Xresources ~/.Xresources
else
  echo "   Deleting old one!"
  rm ~/.Xresources
  ln -s $current_path/Xresources ~/.Xresources
fi

#-----------------------------------------------------
# Installing ruby, rails utilities
#-----------------------------------------------------
echo -n "[ tmuxinator ]"

if command_exists ruby; then
  echo "    Installing!"
  gem install tmuxinator
  ln -s $current_path/gemrc ~/.gemrc
  ln -s $current_path/pryrc ~/.pryrc
  ln -s $current_path/irbrc ~/.irbrc
  ln -s $current_path/rdebugrc ~/.rdebugrc
else
  echo "    Aborting, ruby is not installed."
fi
