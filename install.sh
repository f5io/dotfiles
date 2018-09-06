#!/bin/sh

DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}

. $DOTFILES/utils/dep.sh 

# init submodules and checkout real branches

git submodule update --init
git submodule foreach -q --recursive 'branch=$(git config -f $toplevel/.gitmodules submodule.$name.branch); git checkout $branch'

ln -sf $DOTFILES/.brew/bin/brew /usr/local/bin/brew

# ensure deps
dep --force --brew vim
dep --force --brew zsh
dep --force --brew git
dep --force --brew gnupg gpg-agent
dep --brew tmux
dep --brew nvm
dep --brew kubectl
dep --brew jq
dep --brew hub
dep --brew magic-wormhole wormhole
dep --brew fzf
dep --brew pinentry-mac


# install vim

#ln -sf $DOTFILES/.vim ~/.vim
#ln -sf $DOTFILES/.vimrc ~/.vimrc
#vim -c ":call minpac#update('', {'do': 'quit'})"

# install tmux

#ln -sf $DOTFILES/.tmux ~/.tmux
#ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
#ln -sf $DOTFILES/.tmux-powerlinerc ~/.tmux-powerlinerc

# install alacritty

#ln -sf $DOTFILES/.alacritty.yml ~/.alacritty.yml
