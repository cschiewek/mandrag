# Mandrag

[![CircleCI](https://circleci.com/gh/cschiewek/mandrag.svg?style=svg)](https://circleci.com/gh/cschiewek/mandrag)

Zero Confing Elixir Deployments to [Kubernetes](https://kubernetes.io/) via [Distilerry](https://github.com/bitwalker/distillery) and [Helm](https://helm.sh/)

## Requirements
Mandrag expects that you have docker, kubectl and helm binaries installed and configured.  Currently, It also expects that you have a helm chart in the `chart` directory.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mandrag` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mandrag, "~> 0.6.0"}
  ]
end
```

## Configure

Mandrag doesn't require configuation, it'll introspect the parent mix config to derive configuration, and use it's own built-in [Dockerfile](tk), but you can override those values as seen below.

```elixir
config :mandrag,
  # The name of the app and release. Defaults to the :app key in the parent mix project.
  app: :app_name,
  # The docker repo to push to. Defaults to `docker/app_name`.
  docker_repo: docker/another_name,
  # The path to the Dockerfile to be used.  Defaults to the Dockerfile inside this package.
  dockerfile_path: "Dockerfile",
  # A map of values that are translated to `--build-arg` arguments.
  docker_build_args: %{key: "value"}
```

TODO for 1.0:
- Add dockerfile export
- Add default Helm chart for zero conifg standup.  (or mabye just create a [draft](https://draft.sh/) pack?)

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mandrag](https://hexdocs.pm/mandrag).
