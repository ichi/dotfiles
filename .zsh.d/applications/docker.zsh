if which docker > /dev/null 2>&1; then
  alias dc='docker-compose'

  function dcbash () {
    docker-compose run --rm $1 bash
  }

  function dcexec () {
    docker-compose run --rm $1 ${@:2}
  }
fi
