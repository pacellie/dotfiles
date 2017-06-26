#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles

dir=~/.dotfiles
olddir=~/.dotfiles_old
files=".tumx.conf .vimrc .gitconfig .zshrc"

# create backup directory
if [ ! -d $olddir ]; then
	mkdir -p $olddir
fi

# move existing dotfiles in homedir to dotfiles_old directory
# create symlinks for all files in $files
for file in $files; do
	if [ -e ~/$file ] && [ ! -L ~/$file ]; then
		mv ~/$file $olddir
	fi
    ln -sfnv $dir/$file ~/
done

echo "done"
