#!/bin/sh

DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}

. $DOTFILES/utils.sh 

# init submodules and checkout real branches
init_submodules

# setup brew
setup_brew

# ensure deps
dep --cask alacritty
dep --force --brew vim
dep --force --brew zsh
dep --force --brew git
dep --force --brew gnupg gpg
dep --force --brew nvm
dep --brew tmux
dep --brew kubectl
dep --brew jq
dep --brew hub
dep --brew magic-wormhole wormhole
dep --brew fzf
dep --brew pinentry-mac
dep --brew zplug
dep --brew ag
dep --brew bat

# install vim
link .vim
link .vimrc
vim -c ":call minpac#update('', {'do': 'quit'})"

# install tmux
link .tmux
link .tmux.conf
link .tmux-powerlinerc

# install alacritty
link .alacritty.yml

# install zshrc
link .zshrc

chsh -s $(which zsh)
