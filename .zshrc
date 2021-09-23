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
      virtualenv env
      source env/bin/activate
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

function gcp() {
	git status
	read -p ‘add: ' filestoadd
	git add $filestoadd
	read -p ‘commit message: ' msg
	git commit -m “msg” --no-verify
	git push origin $(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
}

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
alias l='lynx'
alias python=python3
alias ga='git add'
alias gs='git status'
alias gaa='git add .'
alias gpo='git push -u origin'
alias gc='git commit -m'
alias r='source ~/.zshrc'
alias gca='git commit -am'
alias goo='lynx google.com'
alias ddg='lynx duckduckgo.com'
alias go="/usr/local/go/bin/go"

# Paths
#export GOBIN="/Users/vaanshlakhwara/go/bin"
#export PATH="$PATH:$(yarn global bin)"
#export PATH=${PATH}:/usr/local/mysql/bin/
#export PATH=$HOME/bin:/usr/local/bin:$PATH
#export ZSH="/Users/vaanshlakhwara/.oh-my-zsh"
#export PATH=/usr/local/lib/node_modules/npm:$PATH
#export PATH=$$PATH:/usr/local/share/dotnet/
#export PATH="/Users/vaanshlakhwara/opt/anaconda3/bin:$PATH"
#export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
#export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
#export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(yarn global bin)"
export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/vaanshlakhwara/.oh-my-zsh"
export PATH=/usr/local/lib/node_modules/npm:$PATH
export PATH="/Users/vaanshlakhwara/opt/anaconda3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
