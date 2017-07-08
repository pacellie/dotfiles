#############################################################
# PROMPT
#############################################################

# support 256 color terminal
export TERM="tmux-256color"
BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# set up powerlevel9k
source  ~/powerlevel9k/powerlevel9k.zsh-theme


POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH='1'
POWERLEVEL9K_SHORTEN_DELIMITER=''

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv dir vcs)

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='000'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='203'
POWERLEVEL9K_CONTEXT_ROOT_SUBFOLDER_BACKGROUND='203'

POWERLEVEL9K_VIRTUALENV_FOREGROUND='000'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='005'

POWERLEVEL9K_DIR_HOME_BACKGROUND='012'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='012'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='012'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'

#############################################################
# FUNCTIONS
#############################################################

# open pdfs with okular without cluttering the terminal
pdf() {
        okular "$@" >&/dev/null &
}

# open google-chrome browser with no arguments
# or a variable number of html files
browser() {
        google-chrome "$@" >&/dev/null &
}

# don't add anything to the path if it is already there
pathmunge() {
	if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}

# extract archives
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)       bunzip2 $1    ;;
            *.rar)       rar x $1      ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1     ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip $1      ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#############################################################
# ALIASES
#############################################################

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'

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

# tmux alias
alias tmux='tmux -2'

# eclipse - i really really love the eclipse installer ...
alias eclipse='sudo /opt/eclipse/eclipse >&/dev/null'

# rstudio - throw away the garbage
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

# python virtualenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/Code/Python
source /usr/local/bin/virtualenvwrapper.sh

# set the path with pathmunge
pathmunge $HOME/.stack.snapshots/x86_64-linux/lts-6.12/7.10.3/bin
pathmunge $HOME/.local/share/umake/bin
pathmunge $HOME/bin
pathmunge $HOME/.local/bin
pathmunge $HOME/Documents/Code/Golang/bin
pathmunge /opt/mssql-tools/bin
export PATH
