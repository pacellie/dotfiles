#############################################################
# PROMPT
#############################################################

# support 256 color terminal
export TERM="xterm-256color"

# set up powerlevel9k
source  ~/powerlevel9k/powerlevel9k.zsh-theme


POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH='1'
POWERLEVEL9K_SHORTEN_DELIMITER=''

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='000'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='203'
POWERLEVEL9K_CONTEXT_ROOT_SUBFOLDER_BACKGROUND='203'

POWERLEVEL9K_DIR_HOME_BACKGROUND='012'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='012'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='012'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'

#############################################################
# FUNCTIONS
#############################################################

# open pdfs with okular without cluttering the terminal
function pdf() {
        okular "$@" >&/dev/null &
}

# open google-chrome browser with no arguments
# or a variable number of html files
function browser() {
        google-chrome "$@" >&/dev/null &
}

# don't add anything to the path if it is already there
function pathmunge() {
	if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}

#############################################################
# ALIASES
#############################################################

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'

# navigation aliases
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'

# update alias
alias update='sudo apt-get update && sudo apt-get upgrade'

# path alias
alias path='echo $PATH'

# eliminate strange error after closing gvim
alias gvim="gvim 2>/dev/null"

# eclipse - i really really love the eclipse installer ...
alias eclipse='sudo /opt/eclipse/eclipse >&/dev/null'

# rstudio - throw away the garbaged
alias rstudio='rstudio >&/dev/null &'

# hide netbeans and intellij error messages when launching from terminal
alias netbeans='netbeans >&/dev/null &'
alias intellij='idea >&/dev/null &'

# pycharm alias
alias pycharm='charm >&/dev/null &'

# goglang alias
alias goglang='/opt/Gogland-171.3780.106/bin/gogland.sh >&/dev/null &'

# mysql-workbench alias
alias mysqlwb='/usr/bin/mysql-workbench >&/dev/null &'

# redshift background alias
alias redshift='redshift &'

# libre office background alias
alias office='libreoffice >&/dev/null &'

#############################################################
# PATHS
#############################################################

# OPAM configuration
. /home/martin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# export the default editor
export EDITOR='vim';

# export golang path GOPATH
export GOPATH=$HOME/Documents/Code/Golang

# set the path with pathmunge from .bash_function
pathmunge $HOME/.stack.snapshots/x86_64-linux/lts-6.12/7.10.3/bin
pathmunge $HOME/.local/share/umake/bin
pathmunge $HOME/bin
pathmunge $HOME/.local/bin
pathmunge $HOME/Documents/Code/Golang/bin
pathmunge /opt/mssql-tools/bin
export PATH
