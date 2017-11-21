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
    {:mandrag, "~> 0.3.0"}
  ]
end
```

## Configure
```elixir
config :mandrag, app: :app_name
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mandrag](https://hexdocs.pm/mandrag).
