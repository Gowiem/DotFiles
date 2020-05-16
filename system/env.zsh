# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use VSCode for my editor.
  export EDITOR='code'
  export KUBE_EDITOR="vim"
fi

export PROJECTS=~/Workspace
