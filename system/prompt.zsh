# eval "$(starship init zsh)"

## Author: Matt Gowie
#######################

autoload colors && colors

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Color vars
eval gray='$FG[237]'
eval orange='$FG[214]'
eval lightBlue='$FG[075]'
eval white='$FG[white]'

PROMPT='%{$reset_color%} $FG[032]%c `git_prompt_info` $FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# Right prompt
# RPROMPT='`aws_prompt_info` `kubectx_prompt_info` `terraform_prompt_info` `golang_prompt_info` `python_prompt_info` `node_prompt_info` `ruby_prompt_info` %{$FG[214]%}%n@%m%{$reset_color%}%'
RPROMPT='`aws_prompt_info` `kubectx_prompt_info` `terraform_prompt_info` %{$FG[214]%}Gowiem@%m%{$reset_color%}%'
RPROMPT_BAK=$RPROMPT
# ## Python Virtualenv Hooks
# ###########################
# # These need to be copied into the ~/.virtualenvs postactivate/postdeactive scripts
# # TODO: Should have a script that does the above if the files are around

# # postactivate
# _OLD_RPROMPT="$RPROMPT"
# RPROMPT="%{${fg_bold[white]}%}[env: %{${fg[green]}%}$(basename \"$VIRTUAL_ENV\")%{$white%}] %{$FG[214]%}%n@%m%{$reset_color%}%"

# #postdeactivate
# RPROMPT="$_OLD_RPROMPT"

## Prompt Function
###################

function remove_rprompt() {
  export RPROMPT=""
}

function add_rprompt() {
  export RPROMPT=$RPROMPT_BAK
}

function aws_prompt_info() {
  if [[ ! -z "$AWS_PROFILE" ]]; then
    echo "%{$white%}% [aws: $FG[190]${AWS_PROFILE}%{$reset_color%}%{$white%}]"
  fi
}

function kubectx_prompt_info() {
  current=$(kubectl config current-context)
  # if [[ $current == "arn:aws:eks:us-east-1:xxxxxxxxxx:cluster/cluster-blah" ]]; then
  # else
    echo "%{$white%}% [kctx: $FG[202]$current%{$reset_color%}%{$white%}]"
  # fi
}

function golang_prompt_info() {
  go_ver=$(go version 2>&1 | sed "s/.* go\([0-9]\).\([0-9]*\).*/\1.\2/")
  echo "[go: %{$FG[222]%}${go_ver}%{$reset_color%}%{$white%}]"
}

# Terraform version is too damn slow. It's sad.
function terraform_prompt_info() {
  # version=$(terraform --version 2>&1 | grep "Terraform v" | cut -d ' ' -f 2 | head -n 1 | cut -d 'v' -f 2)

  # if [ -d ".terraform/" ]; then
  #   workspace=$(terraform workspace show)
  # else
  #   workspace="not_found"
  # fi

  # if [[ "$workspace" == "not_found" ]]; then
  #   echo "$FG[white][tf: $FG[127]v${version}%{$reset_color%}$FG[white]]"
  # else
  #   echo "$FG[white][tf: $FG[127]v${version}@${workspace}%{$reset_color%}$FG[white]]"
  # fi
}

function python_prompt_info() {
  python_ver=$(python -V 2>&1 | sed "s/.* \([0-9]\).\([0-9]\).\([0-9]\)/\1.\2.\3/")
  echo "%{$white%}% [py: %{$FG[037]%}v${python_ver}%{$reset_color%}%{$white%}]"
}

function node_prompt_info() {
  echo "[node: %{$FG[070]%}$(node --version)%{$reset_color%}%{$white%}]"
}

function ruby_prompt_info() {
  ruby_ver=$($HOME/.rvm/bin/rvm-prompt 2>&1 | sed "s/ruby-\([0-9]\).\([0-9]\).\([0-9]\)/\1.\2.\3/")
  echo "[ruby: %{$FG[009]%}v${ruby_ver}%{$reset_color%}%{$white%}]"
}

## Git Hooks
#############

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2>/dev/null) ||
    ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  echo "$FG[075](branch:$FG[035]${ref#refs/heads/}$FG[214]$(parse_git_dirty)$FG[075])"
}

# Checks if working tree is dirty
parse_git_dirty() {
  local SUBMODULE_SYNTAX=''
  local GIT_STATUS=''
  local CLEAN_MESSAGE='nothing to commit (working directory clean)'
  if [[ "$(command git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      SUBMODULE_SYNTAX="--ignore-submodules=dirty"
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} -uno 2>/dev/null | tail -n1)
    else
      GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} 2>/dev/null | tail -n1)
    fi
    if [[ -n $GIT_STATUS ]]; then
      echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
      echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}
