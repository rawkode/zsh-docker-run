# zsh Docker Run

Run commands "naturally" without having them installed with Docker.

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
