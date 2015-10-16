# Lucas Theme
# Modified from agnoster theme

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo -n "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Dir: current working directory
prompt_dir() {
  echo -ne "%F{blue}$(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")"
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚠︎"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && echo -n "$symbols "
}

build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  /usr/local/bin/git-radar --zsh
  echo -ne " %F{red}→%f%b "
}

PROMPT='$(build_prompt)'
