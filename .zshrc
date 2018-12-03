# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="false"
plugins=(cabal, virtualenvwrapper, git)
source $ZSH/oh-my-zsh.sh

# Base 16 Theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# tmuxp completion
autoload bashcompinit
bashcompinit
eval "$(_TMUXP_COMPLETE=source tmuxp)"

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

# docker
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# disable auto title
export DISABLE_AUTO_TITLE='true'

# export the default editor
export EDITOR='vim'
export PAGER='less'

# python
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/Envs
export PROJECT_HOME=$HOME/Documents/Code/Python
source /usr/local/bin/virtualenvwrapper.sh

# javascript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use v8.12.0 > /dev/null

# java
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

# set the path with pathmunge
pathmunge $HOME/.local/share/umake/bin
pathmunge $HOME/bin
pathmunge $HOME/.local/bin
pathmunge $HOME/.jetbrains/idea-IU-171.4694.70/bin
pathmunge $HOME/Documents/Code/Bash
pathmunge $HOME/.stack/programs/x86_64-linux/ghc-8.0.2/bin
pathmunge $HOME/Envs
pathmunge $HOME/.conscript/bin
pathmunge /usr/local/lib/elixir/bin
pathmunge $HOME/.local/Isabelle2017
pathmunge $HOME/.local/Isabelle2017/bin
pathmunge $HOME/.local/Isabelle2018
pathmunge $HOME/.local/Isabelle2018/bin
pathmunge $JAVA_HOME/bin
pathmunge $HOME/.eclipse/java-photon/eclipse
pathmunge /opt/Postman/app
pathmunge $HOME/.cargo/bin
pathmunge export PATH

# OPAM configuration
. /home/martin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/martin/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/martin/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/martin/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/martin/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/martin/.sdkman"
[[ -s "/home/martin/.sdkman/bin/sdkman-init.sh" ]] && source "/home/martin/.sdkman/bin/sdkman-init.sh"
