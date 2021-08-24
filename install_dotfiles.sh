#!/bin/bash

# Dependencies:
# apt, pip, snap

# cache existing settings to dotfiles_old
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc zshrc tmux.conf gitconfig"

mkdir -p $olddir
cd $dir

for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim-plug plugins
nvim +'PlugInstall --sync' +qa

# vim plugin dependencies
mkdir ~/.vim/undodir
apt install nodejs
pip3 install jedi
pip3 install pynvim --upgrade

# Node
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs

# ALE: Asynchronous Lint Engine
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale

# tmux
apt install tmux
tmux source-file ~/.tmux.conf

# neovim
snap install nvim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim/init.vim

