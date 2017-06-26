# zsh Docker Run

Run commands "naturally" without having them installed with Docker.

Add a simple function (Example below) to your zshrc file and this module will
workout if your command should be run with `docker run`, or if there's a suitble image
configured in a `docker-compose.yml`, it will use `docker-compose run`

## Install

```shell
# For zplug
zplug "rawkode/zshrc-docker-run"
```

## Setup

Add functions to your `.zshrc`. One example below, more inside `example-zshrc`

```shell
function elixir {
  run_with_docker "image_name" "image_tag" "command" $@
}
```
