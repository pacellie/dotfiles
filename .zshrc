# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(cabal, virtualenvwrapper, git)
source $ZSH/oh-my-zsh.sh

# Base 16 Theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#############################################################
# FUNCTIONS
#############################################################

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

# intellij
alias idea='idea.sh &'

#############################################################
# PATHS
#############################################################

# export the default editor
export EDITOR='vim'
export PAGER='less'

# python
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/Documents/Code/Python
source /usr/local/bin/virtualenvwrapper.sh

# set up faster navigation
export WSB=$HOME/Documents/Code/Bash
export WSG=$HOME/Documents/Code/Golang
export WSH=$HOME/Documents/Code/Haskell
export WSJ=$HOME/Documents/Code/Java
export WSL=$HOME/Documents/Code/Latex
export WSM=$HOME/Documents/Code/Markdown
export WSP=$HOME/Documents/Code/Python
export WSR=$HOME/Documents/Code/R
export WSW=$HOME/Documents/Code/Web


# set the path with pathmunge
pathmunge $HOME/.local/share/umake/bin
pathmunge $HOME/bin
pathmunge $HOME/.local/bin
pathmunge $HOME/.jetbrains/idea-IU-171.4694.70/bin
pathmunge $HOME/Documents/Code/Bash
pathmunge $HOME/.stack/programs/x86_64-linux/ghc-8.0.2/bin
pathmunge $HOME/.vim/bundle/vim-live-latex-preview/bin
export PATH
