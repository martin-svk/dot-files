#!/bin/bash

#-----------------------------------------------------
# @author Martin Toma
# @version 5.1
# @creted Fri Nov 15 13:13:22 CET 2013
#-----------------------------------------------------

# Dont continue on error
set -e

#-----------------------------------------------------
# Functions and variables
#-----------------------------------------------------
current_path=`pwd`

command_exists () {
  type "$1" > /dev/null 2>$1
}

install_oh_my_zsh () {
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  ln -sf $current_path/shell/martinus.zsh-theme ~/.oh-my-zsh/themes/martinus.zsh-theme
  echo "    Change your default shell to zsh"
  sudo chsh
}

install_plug_nvim() {
  curl -fLo ~/config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvim_folder() {
  mkdir -p ~/.config/nvim/autoload
  install_plug_nvim
  ln -sf $current_path/nvim/dictionary.utf-8.add ~/config/nvim/dictionary.utf-8.add
  ln -sf $current_path/nvim/ultisnips/ ~/config/nvim/UltiSnips
}

#-----------------------------------------------------
# Basic requirements check
#-----------------------------------------------------

if !command_exists curl; then
  sudo apt-get install -y curl
fi

#-----------------------------------------------------
# ZSH installation
#-----------------------------------------------------

echo -n "[ oh-my-zsh ]"

if command_exists zsh; then
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh my zsh is"
    install_oh_my_zsh
  fi
else
  echo "Installing ZSH."
  sudo apt-get install zsh -y
fi

echo -n "[ zshrc ]"

if [ ! -f ~/.zshrc ]; then
  echo "    Creating!"
  ln -sf $current_path/shell/zshrc ~/.zshrc
else
  echo "    Deleting old one!"
  rm ~/.zshrc
  ln -sf $current_path/shell/zshrc ~/.zshrc
fi

#-----------------------------------------------------
# Git (config, ignore)
#-----------------------------------------------------
echo -n "[ gitconfig ]"

if [ ! -f ~/.gitconfig ]; then
  echo "    Creating!"
  ln -sf $current_path/git/gitconfig ~/.gitconfig
else
  echo "    Deleting old one!"
  rm ~/.gitconfig
  ln -sf $current_path/git/gitconfig ~/.gitconfig
fi

echo -n "[ gitignore ]"

if [ ! -f ~/.gitignore ]; then
  echo "    Creating!"
  ln -sf $current_path/git/gitignore ~/.gitignore
else
  echo "    Deleting old one!"
  rm ~/.gitignore
  ln -sf $current_path/git/gitignore ~/.gitignore
fi

#-----------------------------------------------------
# Neovim, dictionary, ultisnips
#-----------------------------------------------------
echo -n "[ init.vim ]"

if !command_exists nvim; then
  sudo add-apt-repository ppa:neovim-ppa/unstable && sudo apt-get update && sudo apt-get install -y neovim
fi

if [ ! -f ~/config/nvim/init.vim ]; then
  echo "    Creating!"
  ln -sf $current_path/vim/init.vim ~/config/nvim/init.vim
else
  echo "    Deleting old one!"
  rm ~/config/nvim/init.vim
  ln -sf $current_path/vim/init.vim ~/config/nvim/init.vim
fi

if [ ! -d ~/config/nvim ]; then
  mkdir ~/config/nvim
  install_nvim_folder
else
  rm -rf ~/config/nvim
  install_nvim_folder
fi

#-----------------------------------------------------
# Installing tmux
#-----------------------------------------------------
echo -n "[ tmux.conf ]"

if !command_exists tmux; then
  sudo apt-get install tmux -y
fi

if [ ! -f ~/.tmux.conf ]; then
  echo "    Creating!"
  ln -sf $current_path/tmux/tmux.conf ~/.tmux.conf
else
  echo "    Deleting old one!"
  rm ~/.tmux.conf
  ln -sf $current_path/tmux/tmux.conf ~/.tmux.conf
fi

#-----------------------------------------------------
# Installing Xresources
#-----------------------------------------------------
echo -n "[ Xresources ]"

if !command_exists xterm; then
  sudo apt-get install xterm -y
fi

if [ ! -f ~/.Xresources ]; then
  echo "   Creating!"
  ln -sf $current_path/shell/Xresources ~/.Xresources
else
  echo "   Deleting old one!"
  rm ~/.Xresources
  ln -sf $current_path/shell/Xresources ~/.Xresources
fi

#-----------------------------------------------------
# Installing ruby utilities
#-----------------------------------------------------
echo -n "[ Ruby utilities (gemrc, irbrc, rdebugrc) ]"

if command_exists ruby; then
  echo "   Creating!"
  ln -sf $current_path/ruby/gemrc ~/.gemrc
  ln -sf $current_path/ruby/irbrc ~/.irbrc
  ln -sf $current_path/ruby/rdebugrc ~/.rdebugrc
  if command_exists pry; then
    ln -sf $current_path/ruby/pryrc ~/.pryrc
  else
    echo "   Installing pry!"
    gem install pry && ln -sf $current_path/ruby/pryrc ~/.pryrc
  fi
else
  echo "    Installing, rbenv and rubybuild."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo "    Restart your shell and install ruby by rbenv install ruby-version"
fi

#-----------------------------------------------------
# Installing Ag
#-----------------------------------------------------

if command_exists ag; then
  ln -sf $current_path/other/agignore ~/.agignore
else
  sudo apt-get install -y silversearcher-ag
  ln -sf $current_path/other/agignore ~/.agignore
fi
