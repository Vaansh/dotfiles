 #/$$$$$$$                      /$$          
#| $$__  $$                    |__/          
#| $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$$
#| $$$$$$$  |____  $$ /$$_____/| $$ /$$_____/
#| $$__  $$  /$$$$$$$|  $$$$$$ | $$| $$      
#| $$  \ $$ /$$__  $$ \____  $$| $$| $$      
#| $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$|  $$$$$$$
#|_______/  \_______/|_______/ |__/ \_______/
                                            
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# History
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

 #/$$$$$$$  /$$                     /$$                    
#| $$__  $$| $$                    |__/                    
#| $$  \ $$| $$ /$$   /$$  /$$$$$$  /$$ /$$$$$$$   /$$$$$$$
#| $$$$$$$/| $$| $$  | $$ /$$__  $$| $$| $$__  $$ /$$_____/
#| $$____/ | $$| $$  | $$| $$  \ $$| $$| $$  \ $$|  $$$$$$ 
#| $$      | $$| $$  | $$| $$  | $$| $$| $$  | $$ \____  $$
#| $$      | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$ /$$$$$$$/
#|__/      |__/ \______/  \____  $$|__/|__/  |__/|_______/ 
                         #/$$  \ $$                        
                        #|  $$$$$$/                        
                         #\______/                         
                         
plugins=(
  git
  osx
  rake
  ruby
  rbenv
  dotenv
  bundler
  wakatime
  history-substring-search
)


 #/$$$$$$$$                                                /$$$           /$$    /$$ /$$              
#| $$_____/                                               /$$ $$         | $$   | $$|__/              
#| $$    /$$   /$$ /$$$$$$$   /$$$$$$$  /$$$$$$$         |  $$$          | $$   | $$ /$$ /$$$$$$/$$$$ 
#| $$$$$| $$  | $$| $$__  $$ /$$_____/ /$$_____/          /$$ $$/$$      |  $$ / $$/| $$| $$_  $$_  $$
#| $$__/| $$  | $$| $$  \ $$| $$      |  $$$$$$          | $$  $$_/       \  $$ $$/ | $$| $$ \ $$ \ $$
#| $$   | $$  | $$| $$  | $$| $$       \____  $$         | $$\  $$         \  $$$/  | $$| $$ | $$ | $$
#| $$   |  $$$$$$/| $$  | $$|  $$$$$$$ /$$$$$$$//$$      |  $$$$/$$         \  $/   | $$| $$ | $$ | $$
#|__/    \______/ |__/  |__/ \_______/|_______/|__/       \____/\_/          \_/    |__/|__/ |__/ |__/
  
# create virtual env
function penv() {
  if [ $# -eq 0 ]
    then
      python -m venv venv
      source venv/bin/activate
    else
      deactivate
  fi
}

# git add, commit, push function
function gacp() {
  git add .
  git commit -a -m "$1"
  git push
}

# vi mode
bindkey -v
export KEYTIMEOUT=1

# creds.: Luke Smith
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


  #/$$$$$$  /$$ /$$                                                /$$$           /$$$$$$$             /$$     /$$
 #/$$__  $$| $$|__/                                               /$$ $$         | $$__  $$           | $$    | $$
#| $$  \ $$| $$ /$$  /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$$      |  $$$          | $$  \ $$ /$$$$$$  /$$$$$$  | $$$$$$$   /$$$$$$$
#| $$$$$$$$| $$| $$ |____  $$ /$$_____/ /$$__  $$ /$$_____/       /$$ $$/$$      | $$$$$$$/|____  $$|_  $$_/  | $$__  $$ /$$_____/
#| $$__  $$| $$| $$  /$$$$$$$|  $$$$$$ | $$$$$$$$|  $$$$$$       | $$  $$_/      | $$____/  /$$$$$$$  | $$    | $$  \ $$|  $$$$$$
#| $$  | $$| $$| $$ /$$__  $$ \____  $$| $$_____/ \____  $$      | $$\  $$       | $$      /$$__  $$  | $$ /$$| $$  | $$ \____  $$
#| $$  | $$| $$| $$|  $$$$$$$ /$$$$$$$/|  $$$$$$$ /$$$$$$$/      |  $$$$/$$      | $$     |  $$$$$$$  |  $$$$/| $$  | $$ /$$$$$$$/
#|__/  |__/|__/|__/ \_______/|_______/  \_______/|_______/        \____/\_/      |__/      \_______/   \___/  |__/  |__/|_______/

# Aliases
alias g='git'
alias c='clear'
alias h='history'
alias ga='git add'
alias gs='git status'
alias gaa='git add .'
alias gc='git commit -m'
alias r='source ~/.zshrc'
alias gca='git commit -am'
alias vimr="source ~/.vimrc"

# Paths
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(yarn global bin)"
export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/vaanshlakhwara/.oh-my-zsh"
export PATH=/usr/local/lib/node_modules/npm:$PATH
export PATH="/Users/vaanshlakhwara/opt/anaconda3/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

