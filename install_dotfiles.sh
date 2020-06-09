#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc"

mkdir -p $olddir
cd $dir

for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

# get vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +'PlugInstall --sync' +qa

mkdir ~/.vim/undodir

apt install nodejs

