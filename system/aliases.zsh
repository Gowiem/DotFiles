# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias aliases='atom ~/.dotfiles/system/aliases.zsh'
alias dotfiles='atom ~/.dotfiles'

alias tf='terraform'
alias tfyolo='terraform apply -auto-approve'
alias tfplan='tf plan -out=run.plan'
alias tfrun='tf apply run.plan'

alias d='docker'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'

alias dcomp='docker-compose'
alias dcomp.dev='docker-compose -f docker-compose.dev.yml'

alias docker_rm_images='docker rmi -f $(docker images -f dangling=true -q)'
alias docker_rm_containers='docker rm $(docker ps -a -f status=exited -q)'
alias docker_rm_dangling='docker rmi -f $(docker images -f dangling=true -q) && docker rm $(docker ps -a -f status=exited -q)'
alias docker_rm_allthethings='docker rmi -f $(docker images -q) && docker rm $(docker ps -a -q)'

alias kube='kubectl'
