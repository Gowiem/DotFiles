function docker_rm_images() {
  docker rmi -f $(docker images -f dangling=true -q)
}
function docker_rm_containers() {
  docker rm $(docker ps -a -f status=exited -q)
}
function docker_rm_dangling() {
  docker rmi -f $(docker images -f dangling=true -q) && docker rm $(docker ps -a -f status=exited -q)
}
function docker_rm_allthethings() {
  docker rmi -f $(docker images -q) && docker rm $(docker ps -a -q)
}
