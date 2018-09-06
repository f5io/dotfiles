function dc() {
  if [ "$1" = "clean" ]; then
    if [ "$2" = "stop" ]; then
      docker-compose stop
    fi
    docker rm $(docker ps -a -q) -f 
    docker volume rm $(docker volume ls -qf dangling=true)
    if [ "$3" = "images" ]; then
      docker rmi -f $(docker images -q)
    fi
  else
    docker-compose $@
  fi
}

