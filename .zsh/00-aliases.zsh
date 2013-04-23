# Aliases

update() {
  npm -g update
  gem update
  rbenv rehash
  brew update
  brew upgrade
  brew cleanup
}

mkcd() {
  mkdir -p $1
  cd $1
}

ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xvJf $1;;
      *.tar.lzma) tar --lzma xvf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *.dmg) hdiutul mount $1;; # mount OS X disk images
      *) echo "'$1' cannot be extracted via >ex<";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias ..='cd ..'
alias ...='cd ...'
alias _=sudo
alias md='mkdir -p'
alias ls='ls -Gh --color=auto'
alias la='ls -la --color=auto'
alias t=trash
alias hk='git push heroku master'
alias stage='git push stage master'
alias b=bundle
alias la='ls -al'
alias make='make -j9'
alias pg='ping 8.8.8.8'
alias op='open .'
alias sv='ssh lclemente.dyndns.org'
alias mu='open /data/univedo.sparsebundle'
UNIVEDO=/Volumes/univedo
alias u="cd $UNIVEDO/univedo"
alias us="cd $UNIVEDO/uspec"
alias uw="cd $UNIVEDO/web"
alias ru="cd $UNIVEDO/runivedo"
alias gs='git status -sb'
alias gp='git push'
alias gu='git pull --no-edit'
alias gca='git commit -a'
alias gc='git checkout'
alias gb='git branch'
alias gls='git ls-files'
alias ra='rails'
alias bi='brew install'
alias bs='brew search'
alias s='subl -n'
pman() { man $1 -t | open -f -a Preview }
alias cppgm="wget -qO- http://dev.cppgm.org/`whoami`.log"
alias diff=colordiff
