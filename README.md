# zshrc-docker-run

## Run commands naturally, forgetting all about Docker

Run commands "naturally" without having them installed, using Docker.

### Why?

As we adopt Docker more, we install a whole lot less on our machines. Instead of installing node, php, ruby - we pull their latest Docker images. This means that simple commands, such as `npm install` and `irb` become more cumbersome, such as:

```shell
docker run --rm -it --entrypoint=irb ruby:latest
```

### How?

Install this plugin with your favourite zsh plugin manager, I use `zplug`:

```shell
# For zplug
zplug "rawkode/zshrc-docker-run"
```

Now all you need to-do is add some functions to your `.zshrc` file:

```shell
function example {
  run_with_docker "image_name" "image_tag" "command" $@
}

function npm {
  run_with_docker "node" "alpine" "npm" $@
}
```

### More Examples

```shell
function elixir() {
  run_with_docker "elixir" "latest" "elixir" $@
}

function iex() {
  run_with_docker "elixir" "latest" "iex" $@
}

function mix() {
  run_with_docker "elixir" "latest" "mix" $@
}

function go() {
  run_with_docker "golang" "latest" "go" $@
}

function php() {
  run_with_docker "php" "latest" "php" $@
}
```

### What's Next?

- [ ] I'd like to provide a simpler interface, replacing functions with a map?
- [ ] Possibly provide a bunch of defaults, enabling the more popular commands

