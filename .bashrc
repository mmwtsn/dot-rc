# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  source  /etc/bashrc
fi

# Source Bash Aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Source Generic Helper Functions
if [ -f ~/.bash_helpers ]; then
  source ~/.bash_helpers
fi

# Git auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# allow for Vim-like command line movement
set -o vi

# Colors
# Defines local variables to simplify calling colors
black="\[\033[01;30m\]"
red="\[\033[01;31m\]"
green="\[\033[01;32m\]"
yellow="\[\033[01;33m\]"
blue="\[\033[01;34m\]"
magenta="\[\033[01;35m\]"
cyan="\[\033[01;36m\]"
white="\[\033[01;37m\]"

# Git Branch
# Show the current branch minus the leading asterisk and space
function current_git_branch {
  git branch 2> /dev/null | grep ^* | sed 's/^..//' | sed 's/\(.*\)/\(\1\)/'
}

# Custom Prompt
# Function idea credit: shaman.sir via http://stackoverflow.com/a/6086978
function PS1 {
    local environment="maxwell"
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt="⚡ "
    export PS1="$blue[$current_dir]$yellow\$(current_git_branch)$red$prompt$white"
}
PS1

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/local/bin
export PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Set $TERM explicitly to force tmux to recognize 256 colors
export TERM=screen-256color-bce

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
