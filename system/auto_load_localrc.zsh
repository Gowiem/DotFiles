auto_load_localrc() {
  if [[ -a .localrc ]]
  then
    source .localrc
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_load_localrc
