function docker-ruby {
  docker run --rm -it -w='/data' -v $(pwd):/data ruby:latest bash
}

function devenv {
  docker-compose --file $HOME/dotfiles/docker-compose.yml $@
}

function docker-clenaup {
  docker rm -v $(docker ps -a -q)  &> /dev/null
  docker rmi $(docker images -q) &> /dev/null
}
