# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Ubuntu make installation of Ubuntu Make binary symlink
# include user's private bin
PATH=/home/martin/.local/share/umake/bin:$HOME/bin:$PATH
