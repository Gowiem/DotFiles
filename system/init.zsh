## GRC
#######

# GRC colorizes nifty unix tools all over the place
if [[ -f "/usr/local/etc/grc.zsh" ]]; then
  source /usr/local/etc/grc.zsh
fi

## Git Completion
##################

zstyle ':completion:*:*:git:*' script $ZSH/git/git-completion.bash

## localrc
###########

# Load .localrc files on directory change
autoload_localrc() {
  if [[ -e .localrc ]]; then
    source .localrc
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd autoload_localrc

## FZF
#######

# Fuzzy search finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## SleepWatch
##############

# No longer used
# /usr/local/sbin/sleepwatcher --verbose --wakeup /Users/mattg/Workspace/Side-Projects/where_am_i/where_am_i
