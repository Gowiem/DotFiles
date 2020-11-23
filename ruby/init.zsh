function rvm() {
  if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    # Load RVM
    source "$HOME/.rvm/scripts/rvm"

    export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

    # invoke the real rvm function now
    rvm "$@"
  else
    echo "rvm is not installed" >&2
    return 1
  fi
}
