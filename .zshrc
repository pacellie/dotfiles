# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="false"
plugins=(git)
fpath+=~/.zsh/completions
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# Base 16 Theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# disable auto title
export DISABLE_AUTO_TITLE='true'

# export the default editor
export EDITOR='code'
export PAGER='less'

export JAVA_HOME='/home/martin/.sdkman/candidates/java/current/bin'
export AFP20='/home/martin/Documents/Code/Isabelle/afp/afp-2020-04-21/thys'

pathmunge $HOME/.cargo/bin
pathmunge $PATH

export SDKMAN_DIR="/home/martin/.sdkman"
[[ -s "/home/martin/.sdkman/bin/sdkman-init.sh" ]] && source "/home/martin/.sdkman/bin/sdkman-init.sh"

# opam configuration
test -r /home/martin/.opam/opam-init/init.zsh && . /home/martin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
