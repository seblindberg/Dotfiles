# Functions
function git_branch {
	#git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'}
}

function git_dirty {
	st=$(git status 2>/dev/null | tail -n 1)
	if [[ $st != "nothing to commit, working tree clean" ]]; then
		return 0
	else
		return 1
	fi
}

function git_dirty_color {
	if git_dirty; then
		tput setaf 1
	else
		tput setaf 2
	fi
}

function git_prompt {
	branch=$(git_branch)
	if [[ $branch != "" ]]; then
		git_dirty_color
		echo "($branch)"
	fi
}

function get_path {
	path=$(pwd)
	if [[ $path == $ICLOUD_DRIVE* ]]
	then
		echo "${path/$ICLOUD_DRIVE/$(tput setaf 7)iCloud Drive$(tput setaf 4)}"
	else
		echo "${path/$HOME/~}"
	fi
}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export ICLOUD_DRIVE="$HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
export PROJECTS="$ICLOUD_DRIVE/Projekt"

# Import aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Autocomplete bash commands following sudo etc.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Enable colors
export CLICOLOR=1
export LSCOLORS=CxfxexdxBxegedabagacad #gxfxbEaEBxxEhEhBaDaCaD

# Include rbenv in path
export PATH="$HOME/.rbenv/bin:$PATH"

# Initialize rbenv
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi

# Include homebrew's sbin
export PATH="/usr/local/sbin:$PATH"


# Set default editor
export EDITOR=choc

# Setup the prompt
PS1='\n$(tput bold)$(tput setaf 4)$(get_path) $(git_prompt)$(tput sgr0)\n➜ '



