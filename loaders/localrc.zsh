# Load .localrc files on directory change
autoload_localrc() {
  if [[ -e .localrc ]]; then
    source .localrc
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd autoload_localrc
