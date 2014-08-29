# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=lucas

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  atom
  autojump
  bower
  brew
  colorize
  docker
  extract
  git
  github
  go
  npm
  rails
  rake
  rvm
  ruby
  sudo
  vagrant
  xcode
  zsh-syntax-highlighting
  history-substring-search
)

source $ZSH/oh-my-zsh.sh


# User configuration


# Paths
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/go/bin:$PATH # Linux
export PATH=$(go env GOROOT)/bin:$PATH
export PATH=~/src/go/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=~/bin:$PATH

# General
export EDITOR='vim'
export HISTSIZE=100000
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

update() {
  npm -g update
  yes | apm upgrade
  gem update
  brew update && brew upgrade
  brew cleanup
}

mkcd() {
  mkdir -p $1
  cd $1
}

alias t='tail -f'
alias a=atom
alias ad="atom ."
alias b=bundle
alias be='bundle exec'
alias make='make -j 8'
alias pg='ping 8.8.8.8'
alias op='open .'
alias sv='ssh lclemente.dyndns.org'
alias gs='git status -sb'
alias gls='git ls-files'
alias gA='git add -A :/'
alias bi='brew install'
alias bs='brew search'
alias df=dfc
alias du='du -h'
alias ccat=colorize
alias wiki='atom ~/Documents/wiki'
alias texwatch='latexmk -pdf -pvc -interaction=nonstopmode'

# From https://gist.github.com/lelandbatey/8677901
whiteboardCleanup() {
  for f in "$@"; do
    convert "$f" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$(basename $f .jpg).clean.jpg" &
  done
  wait
}

ip() {
  local WIFI=`ipconfig getifaddr en0 2> /dev/null`
  local ETHERNET=`ipconfig getifaddr en5 2> /dev/null`
  local EXT=`curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'`

  if [ "$ETHERNET" != "" ]; then
    echo -n -e "Ethernet:\t "
    echo -e $ETHERNET
  fi

  if [ "$WIFI" != "" ]; then
    echo -n -e "WiFi:\t\t "
    echo -e $WIFI
  fi

  echo -n -e "External:\t "
  echo -e $EXT
}

if [[ $(uname) == Darwin ]]; then
  export DOCKER_HOST=tcp://vagrant:4243
fi

export GOPATH=~/src/go

# Enable autosuggestions
# To install: git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh
export AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=248'
bindkey '^F' forward-word
zle-line-init() {
  zle autosuggest-start
}
zle -N zle-line-init


if [[ -o login ]]; then
  echo "  .=."
  echo " '==c|"
  echo " [)-+|"
  echo " //'_|"
  echo "/]==;\\"
  echo
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
