#!/bin/bash

# ======= DotFiles installator ======
# @author Martin Toma
# @version 1.0
# @date Fri Nov 15 13:13:22 CET 2013

# ======= Necessary variables ======

cpath=`pwd`       # config files path

# ======= Installing all dotfiles ======

cd ~

# Directory structure
# .
# ├── dotlist.txt
# ├── fish
# │   ├── config.fish
# │   └── functions
# │       ├── c.fish
# │       └── rvm.fish
# ├── gitconfig
# ├── install.sh
# ├── README.md
# ├── tmux.conf
# ├── vim
# │   ├── bundle
# │   │   ├── nerdtree
# │   │   │   ├── autoload
# │   │   │   │   └── nerdtree.vim
# │   │   │   ├── doc
# │   │   │   │   ├── NERD_tree.txt
# │   │   │   │   └── tags
# │   │   │   ├── lib
# │   │   │   │   └── nerdtree
# │   │   │   │       ├── bookmark.vim
# │   │   │   │       ├── creator.vim
# │   │   │   │       ├── key_map.vim
# │   │   │   │       ├── menu_controller.vim
# │   │   │   │       ├── menu_item.vim
# │   │   │   │       ├── opener.vim
# │   │   │   │       ├── path.vim
# │   │   │   │       ├── tree_dir_node.vim
# │   │   │   │       └── tree_file_node.vim
# │   │   │   ├── nerdtree_plugin
# │   │   │   │   ├── exec_menuitem.vim
# │   │   │   │   └── fs_menu.vim
# │   │   │   ├── plugin
# │   │   │   │   └── NERD_tree.vim
# │   │   │   ├── README.markdown
# │   │   │   └── syntax
# │   │   │       └── nerdtree.vim
# │   │   ├── vim-airline
# │   │   │   ├── autoload
# │   │   │   │   ├── airline
# │   │   │   │   │   ├── builder.vim
# │   │   │   │   │   ├── debug.vim
# │   │   │   │   │   ├── deprecation.vim
# │   │   │   │   │   ├── extensions
# │   │   │   │   │   │   ├── branch.vim
# │   │   │   │   │   │   ├── bufferline.vim
# │   │   │   │   │   │   ├── commandt.vim
# │   │   │   │   │   │   ├── csv.vim
# │   │   │   │   │   │   ├── ctrlp.vim
# │   │   │   │   │   │   ├── default.vim
# │   │   │   │   │   │   ├── eclim.vim
# │   │   │   │   │   │   ├── example.vim
# │   │   │   │   │   │   ├── hunks.vim
# │   │   │   │   │   │   ├── quickfix.vim
# │   │   │   │   │   │   ├── syntastic.vim
# │   │   │   │   │   │   ├── tabline
# │   │   │   │   │   │   │   └── formatters.vim
# │   │   │   │   │   │   ├── tabline.vim
# │   │   │   │   │   │   ├── tagbar.vim
# │   │   │   │   │   │   ├── undotree.vim
# │   │   │   │   │   │   ├── unite.vim
# │   │   │   │   │   │   ├── virtualenv.vim
# │   │   │   │   │   │   └── whitespace.vim
# │   │   │   │   │   ├── extensions.vim
# │   │   │   │   │   ├── highlighter.vim
# │   │   │   │   │   ├── init.vim
# │   │   │   │   │   ├── parts.vim
# │   │   │   │   │   ├── section.vim
# │   │   │   │   │   ├── themes
# │   │   │   │   │   │   ├── badwolf.vim
# │   │   │   │   │   │   ├── base16.vim
# │   │   │   │   │   │   ├── bubblegum.vim
# │   │   │   │   │   │   ├── dark.vim
# │   │   │   │   │   │   ├── jellybeans.vim
# │   │   │   │   │   │   ├── laederon.vim
# │   │   │   │   │   │   ├── light.vim
# │   │   │   │   │   │   ├── lucius.vim
# │   │   │   │   │   │   ├── luna.vim
# │   │   │   │   │   │   ├── molokai.vim
# │   │   │   │   │   │   ├── monochrome.vim
# │   │   │   │   │   │   ├── murmur.vim
# │   │   │   │   │   │   ├── powerlineish.vim
# │   │   │   │   │   │   ├── serene.vim
# │   │   │   │   │   │   ├── simple.vim
# │   │   │   │   │   │   ├── solarized.vim
# │   │   │   │   │   │   ├── sol.vim
# │   │   │   │   │   │   ├── tomorrow.vim
# │   │   │   │   │   │   ├── ubaryd.vim
# │   │   │   │   │   │   ├── understated.vim
# │   │   │   │   │   │   ├── wombat.vim
# │   │   │   │   │   │   └── zenburn.vim
# │   │   │   │   │   ├── themes.vim
# │   │   │   │   │   └── util.vim
# │   │   │   │   └── airline.vim
# │   │   │   ├── doc
# │   │   │   │   ├── airline.txt
# │   │   │   │   └── tags
# │   │   │   ├── Gemfile
# │   │   │   ├── LICENSE
# │   │   │   ├── plugin
# │   │   │   │   └── airline.vim
# │   │   │   ├── Rakefile
# │   │   │   ├── README.md
# │   │   │   └── t
# │   │   │       ├── airline.vim
# │   │   │       ├── builder.vim
# │   │   │       ├── commands.vim
# │   │   │       ├── extensions_default.vim
# │   │   │       ├── highlighter.vim
# │   │   │       ├── init.vim
# │   │   │       ├── parts.vim
# │   │   │       ├── section.vim
# │   │   │       ├── themes.vim
# │   │   │       └── util.vim
# │   │   ├── vim-tmux-navigator
# │   │   │   ├── pattern-check
# │   │   │   ├── plugin
# │   │   │   │   └── tmux_navigator.vim
# │   │   │   └── README.mkd
# │   │   └── vundle
# │   │       ├── autoload
# │   │       │   ├── vundle
# │   │       │   │   ├── config.vim
# │   │       │   │   ├── installer.vim
# │   │       │   │   └── scripts.vim
# │   │       │   └── vundle.vim
# │   │       ├── doc
# │   │       │   ├── tags
# │   │       │   └── vundle.txt
# │   │       ├── LICENSE-MIT.txt
# │   │       ├── README.md
# │   │       └── test
# │   │           ├── files
# │   │           │   └── test.erl
# │   │           ├── minirc.vim
# │   │           └── vimrc
# │   └── colors
# │       ├── herald.vim
# │       ├── jellybeans.vim
# │       ├── solarized.vim
# │       └── summerfruit256.vim
# ├── vimrc
# └── Xresources
# 
# 30 directories, 113 files
