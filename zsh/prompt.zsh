autoload colors && colors
## Author: Matt Gowie
## Adapted from Andy Fleming's https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
## Updated: Sun Nov. 3rd 2013
##############################

## I just hacked this together pretty badly after migrating away from oh-my-zsh,
## so it not kinda sucks. Works though!

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
RPROMPT='`terraform_prompt_info` %{$white%}% [py: %{$FG[037]%}v$(python -V 2>&1 | sed "s/.* \([0-9]\).\([0-9]\).\([0-9]\)/\1.\2.\3/")%{$reset_color%}%{$white%}] [node: %{$FG[070]%}$(node --version)%{$reset_color%}%{$white%}] [ruby: %{$FG[009]%}v$($HOME/.rvm/bin/rvm-prompt 2>&1 | sed "s/ruby-\([0-9]\).\([0-9]\).\([0-9]\)/\1.\2.\3/")%{$reset_color%}%{$white%}] %{$FG[214]%}%n@%m%{$reset_color%}%'

## Python Virtualenv Hooks
###########################
# These need to be copied into the ~/.virtualenvs postactivate/postdeactive scripts
# TODO: Should have a script that does the above if the files are around

# postactivate
_OLD_RPROMPT="$RPROMPT"
RPROMPT="%{${fg_bold[white]}%}[env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{$white%}] %{$FG[214]%}%n@%m%{$reset_color%}%"

#postdeactivate
RPROMPT="$_OLD_RPROMPT"


## Git Hooks
#############

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$FG[075](branch:$FG[035]${ref#refs/heads/}$FG[214]$(parse_git_dirty)$FG[075])"
}

function terraform_prompt_info() {
  version=$( terraform --version 2>&1 | cut -d ' ' -f 2 | head -n 1 | cut -d 'v' -f 2 )

  if [ -d ".terraform/" ]; then
    workspace=$( terraform workspace show )
  else
    workspace="not_found"
  fi

  if [[ "$workspace" == "not_found" ]]; then
    echo "$FG[white][tf: $FG[127] v${version}%{$reset_color%}$FG[white]]"
  else
    echo "$FG[white][tf: $FG[127] v${version}@${workspace}%{$reset_color%}$FG[white]]"
  fi
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
        GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} -uno 2> /dev/null | tail -n1)
    else
        GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} 2> /dev/null | tail -n1)
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


# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# if (( $+commands[git] ))
# then
#   git="$commands[git]"
# else
#   git="/usr/bin/git"
# fi

# git_branch() {
#   echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
# }

# git_dirty() {
#   st=$($git status 2>/dev/null | tail -n 1)
#   if [[ $st == "" ]]
#   then
#     echo ""
#   else
#     if [[ "$st" =~ ^nothing ]]
#     then
#       echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
#     else
#       echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
#     fi
#   fi
# }

# git_prompt_info () {
#  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
#  echo "${ref#refs/heads/}"
# }

# unpushed () {
#   $git cherry -v @{upstream} 2>/dev/null
# }

# need_push () {
#   if [[ $(unpushed) == "" ]]
#   then
#     echo " "
#   else
#     echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
#   fi
# }

# ruby_version() {
#   if (( $+commands[rbenv] ))
#   then
#     echo "$(rbenv version | awk '{print $1}')"
#   fi

#   if (( $+commands[rvm-prompt] ))
#   then
#     echo "$(rvm-prompt | awk '{print $1}')"
#   fi
# }

# rb_prompt() {
#   if ! [[ -z "$(ruby_version)" ]]
#   then
#     echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
#   else
#     echo ""
#   fi
# }

# directory_name() {
#   echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
# }

# export PROMPT=$'\n$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n› '
# set_prompt () {
#   export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
# }

# precmd() {
#   title "zsh" "%m" "%55<...<%~"
#   set_prompt
# }
