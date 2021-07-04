#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# System Maintainence
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg
export PATH=${PATH}:/usr/local/mysql/bin/
export PATH="$PATH:$(yarn global bin)"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/vaanshlakhwara/opt/anaconda3/bin:$PATH"
export PATH=/usr/local/lib/node_modules/npm:$PATH

# Some aliases
alias e="$EDITOR"
alias v="$EDITOR"
alias f="vifm"
alias r="ranger"
alias ka="killall"
alias g="git"
alias mkd="mkdir -pv"

# Adding color
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -i" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
