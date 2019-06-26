# Mandrag

[![CircleCI](https://circleci.com/gh/cschiewek/mandrag.svg?style=svg)](https://circleci.com/gh/cschiewek/mandrag)

Zero Confing Elixir Deployments to [Kubernetes](https://kubernetes.io/) and [Helm](https://helm.sh/)

## Requirements
- Elixir 1.9 (See the older v0.7.x tags for versions that support > 1.9 via Distillery)
- Mandrag expects that you have docker and helm binaries installed and configured.
- Currently, It also expects that you have a helm chart in the `chart` directory.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mandrag` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mandrag, "~> 0.8.0"}
  ]
end
```

## Configure

Mandrag doesn't require configuation, it'll introspect the parent mix config to derive configuration, and use it's own built-in [Dockerfile](https://github.com/cschiewek/mandrag/blob/master/priv/Dockerfile),
and [Helm Chart](https://github.com/cschiewek/mandrag/blob/master/priv/charts) but you can override those values as seen below.

```elixir
config :mandrag,
  # The name of the app and release. Defaults to the :app key in the parent mix project.
  app: :app_name,
  # The docker repo to push to. Defaults to `app_name`.
  docker_repo: "docker_user_name/app_name",
  # The path to the Dockerfile to be used.  Defaults to the Dockerfile inside this package.
  dockerfile_path: "Dockerfile",
  # A map of values that are translated to `--build-arg` arguments.
  docker_build_args: %{key: "value"},
  # The kubernetes context, defaults to your current context
  k8s_context: "docker-for-desktop",
  # Path to the helm chart to use to deploy.  Defaults to the chart inside the package.
  chart_path:  "charts/app_name"
```

## Running
```
mix mandrag.deploy
```

Which is an alias for the following 3 mix tasks
```
mix mandrag.docker.build  # which builds your a docker image with a release of your application
mix mandrag.docker.push   # which pushes said image to a docker image repo
mix mandrag.helm.upgrade  # which installs or upgrades a helm release
```

TODO for 1.0:
- Add default Helm chart for zero conifg standup
- Including secrets and conditional config for postgresql

TODO for 1.x:
- Enable clustering for deploys, probably via [libclsuter](https://github.com/bitwalker/libcluster)
- Use `docker`, and `helm` clients instead of shell commands

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mandrag](https://hexdocs.pm/mandrag).
