## Edit Specific Files
#######################

alias zsh_config="edit $ZSH/zsh/zshrc.symlink"
alias ssh_config="edit ~/.ssh/config"
alias kube_config="edit ~/.kube/config"
alias aws_config="edit ~/.aws/config"
alias aliases="edit ~/.dotfiles/system/aliases.zsh"
alias dotfiles="edit ~/.dotfiles"

## Random Utils
################

alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

alias c='clear'
alias cl='clear'

alias reload!='. ~/.zshrc'
alias reload='reload!'

alias ports='netstat -tulanp'

alias edit='code'

alias pc='pre-commit run -a'

alias stree='open -a /Applications/SourceTree.app'

# rmtrash isn't working and this is driving me nuts.
# alias del='rmtrash'
# alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"

# Pipe my public key to my clipboard.
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo '=> Public key copied to pasteboard.'"

alias grepProj='grep --color=auto -rIni'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## Docker
##########

alias d='docker'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'

alias dcomp='docker-compose'
alias dcomp.dev='docker-compose -f docker-compose.dev.yml'

alias docker_rm_images='docker rmi -f $(docker images -f dangling=true -q)'
alias docker_rm_containers='docker rm $(docker ps -a -f status=exited -q)'
alias docker_rm_dangling='docker rmi -f $(docker images -f dangling=true -q) && docker rm $(docker ps -a -f status=exited -q)'
alias docker_rm_allthethings='docker rmi -f $(docker images -q) && docker rm $(docker ps -a -q)'

alias lzd='lazydocker'

## Color Override Aliases
##########################

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null); then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
