function docker-cleanup {
  docker rm -v $(docker ps -a -q)  &> /dev/null
  docker rmi $(docker images -q) &> /dev/null
}
