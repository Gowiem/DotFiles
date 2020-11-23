# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]]; then
  # Use VSCode for my editor.
  export EDITOR='code --wait'
  export KUBE_EDITOR="code --wait"
fi

export PROJECTS=~/Workspace
