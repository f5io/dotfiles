#!/bin/sh

set -e

# init submodules and checkout real branches

git submodule update --init
git submodule foreach -q --recursive 'branch=$(git config -f $toplevel/.gitmodules submodule.$name.branch); git checkout $branch'

# install vim

ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
vim -c ":call minpac#update('', {'do': 'quit'})"

# install tmux

ln -sf ~/.dotfiles/.tmux ~/.tmux
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
