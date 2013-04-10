# Shell options
setopt PROMPT_SUBST
PROMPT='%B%F{green}$(hostname | perl -pe "s/liszt//; s/(\w)\$/\$1 /")%F{blue}$(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g") %F{red}→%f%b '

export TERM='xterm-color'
export WORDCHARS='*?[]~&;!$%^<>'
export EDITOR=vim
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

setopt correct
setopt auto_cd
bindkey -e
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source .zsh/aliases.zsh
source .zsh/paths.zsh

# Initialize completion
autoload -U compinit
fpath=(/usr/local/share/zsh-completions $fpath)
compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
bindkey -M menuselect ' ' accept-and-infer-next-history
bindkey -M menuselect '^?' undo

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups
setopt hist_ignore_space

# Ruby
eval "$(rbenv init - zsh)"

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Stuff

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[default]=bold
ZSH_HIGHLIGHT_STYLES[alias]=bold
ZSH_HIGHLIGHT_STYLES[builtin]=bold
ZSH_HIGHLIGHT_STYLES[function]=bold
ZSH_HIGHLIGHT_STYLES[command]=bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=bold

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
