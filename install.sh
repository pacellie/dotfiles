#!/bin/bash

# This script creates symlinks from the home directory
# to any desired dotfiles in ~/dotfiles

dir=~/.dotfiles
olddir=~/.dotfiles_old
files=".vimrc .gitconfig .git-completion.bash .git-prompt.sh .bash_alias .bash_profile .bash_prompt .bashrc .emacs.d/init.el .emacs.d/myinit.org"

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

# adjust emacs paths
mv ~/init.el ~/.emacs.d/
mv ~/myinit.org ~/.emacs.d/
echo "adjusted init.el and myinit.org paths"

echo "done"
