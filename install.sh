#!/bin/bash

# ======= DotFiles installator ======
# @author Martin Toma
# @version 1.0
# @date Fri Nov 15 13:13:22 CET 2013

# ======= Necessary variables ======

current_path=`pwd`  # config files path

# ======= Installing all dotfiles ======

# Installing GIT
echo -n "[ gitconfig ]"

if [ ! -f ~/.gitconfig ]; then
    echo "    Creating!"
    ln -s $current_path/gitconfig ~/.gitconfig
else
  echo "    Deleting old one!"
  rm ~/.gitconfig
  ln -s $current_path/gitconfig ~/.gitconfig
fi

# Installing vim
echo -n "[ vimrc ]"

if [ ! -f ~/.vimrc ]; then
    echo "        Creating!"
    ln -s $current_path/vimrc ~/.vimrc
else
  echo "        Deleting old one!"
  rm ~/.vimrc
  ln -s $current_path/vimrc ~/.vimrc
fi

if [ -d ~/.vim ]; then
  ln -s $current_path/vim/colors ~/.vim/colors
else
  mkdir ~/.vim
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ln -s $current_path/vim/colors ~/.vim/colors
fi


# Installing tmux
echo -n "[ tmux.conf ]"

if [ ! -f ~/.tmux.conf ]; then
    echo "    Creating!"
    ln -s $current_path/tmux.conf ~/.tmux.conf
else
  echo "    Deleting old one!"
  rm ~/.tmux.conf
  ln -s $current_path/tmux.conf ~/.tmux.conf
fi


# Installing xterm
echo -n "[ Xresources ]"

if [ ! -f ~/.Xresources ]; then
    echo "   Creating!"
    ln -s $current_path/Xresources ~/.Xresources
else
  echo "   Deleting old one!"
  rm ~/.Xresources
  ln -s $current_path/Xresources ~/.Xresources
fi
