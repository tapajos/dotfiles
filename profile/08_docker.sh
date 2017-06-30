function docker-ruby {
  docker run --rm -it -w='/data' -v $(pwd):/data ruby:latest bash
}

function docker-go {
  docker run --rm -it -w='/go' -v $(pwd):/go golang:latest bash
}

function devenv {
  docker-compose --file $HOME/dotfiles/docker-compose.yml $@
}
