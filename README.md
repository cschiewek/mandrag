# Mandrag

Deploy Elixir releases to [Kubernetes](https://kubernetes.io/) via [Distilerry](https://github.com/bitwalker/distillery).

## Requirements
Mandrag expects that you have both docker and kubectl binaries installed, and that kubectl is
configured to access your deploy target.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mandrag` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mandrag, "~> 0.4.0"}
  ]
end
```

## Configure
```elixir
config :mandrag,
  # The name of your app.  Required.
  app: :app_name,
  # If you want to migrate, you need to specify a repo as well.
  repo: App.Repo,
  # You can also specify a docker image, it defaults to the value speficied in :app
  image: docker/app_name,
  # You can specify a kube config that's applied on deploy, it default's to `kubernetes.yml`
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mandrag](https://hexdocs.pm/mandrag).
