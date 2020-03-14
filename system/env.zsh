# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use atom for my editor.
  export EDITOR='atom'
  export KUBE_EDITOR="vim"
fi
