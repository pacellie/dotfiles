# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# OPAM configuration
. /home/martin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
