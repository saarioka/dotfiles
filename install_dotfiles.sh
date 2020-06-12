#!/bin/bash

# cache existing settings to dotfiles_old
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc"

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
vim +'PlugInstall --sync' +qa

# vim plugin dependencies
mkdir ~/.vim/undodir
apt install nodejs
apt install ripgrep

# tmux
printf "set -g default-terminal \"xterm-256color\"\n" > ~/.tmux.conf
tmux source-file ~/.tmux.conf

# neovim
mkdir -p ~/.config
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim/init.vim

