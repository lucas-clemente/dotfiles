# Shell options
setopt PROMPT_SUBST
export PROMPT='%B%F{green}$(hostname -s | perl -pe "s/liszt//i; s/(\w)\$/\$1 /")%F{blue}$(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g") %F{red}→%f%b '

export TERM='xterm-color'
export WORDCHARS='*?[]~&;!$%^<>'
export EDITOR=vim
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

setopt correct
setopt auto_cd
bindkey -e
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3~"   delete-char
bindkey "^H"      run-help

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups
setopt hist_ignore_space
