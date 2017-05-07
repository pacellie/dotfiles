# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

# set up multiple files to source
files=".bash_alias .bash_prompt .bash_function .git-completion.bash"

for file in $files; do
	source "$file";
done;

# export the default editor
export EDITOR='gvim';

# export golang path GOPATH
export GOPATH=$HOME/Documents/Code/Golang

# export java_home ? use java-8-oracle or java-8-openjdk-amd64 ?
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# set the path with pathmunge from .bash_function
pathmunge $HOME/.stack.snapshots/x86_64-linux/lts-6.12/7.10.3/bin
pathmunge $HOME/.local/share/umake/bin
pathmunge $HOME/bin
pathmunge $HOME/.local/bin
export PATH
