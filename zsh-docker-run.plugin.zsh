function can_be_run_through_docker_compose_service() {
  # Look for a service using the image $1 inside docker-compose.yml
  image_name=''
  if [ -f "docker-compose.yml" ];
  then
    image_name=$(grep -B1 -A0 "image: $1" docker-compose.yml | head -n1 | awk -F ":" '{print $1}' | tr -d '[:space:]')
  fi
}

function docker_run() {
  docker run --rm -it -u $UID -v $PWD:/sandbox -v $HOME:$HOME -e HOME=$HOME -w /sandbox --entrypoint=$3 $1:$2 ${@:4}
}

function docker_compose_run() {
  docker-compose run --rm --entrypoint=$1 ${@:2}
}

function run_with_docker() {
  can_be_run_through_docker_compose_service $1

  if [[ ! -z "${image_name// }" ]];
  then
    docker_compose_run $3 $image_name ${@:4}
  else
    docker_run $1 $2 $3 ${@:4}
  fi
}
