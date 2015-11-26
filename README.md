# Mandrag

A simple, extremely assumptive deploy script for [Phoenix](https://phoenixframework.org) apps, with help from [exrm](https://exrm.readme.io/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add mandrag to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
        [{:mandrag, "~> 0.0.1"}]
  end
  ```

  2. Add config info to appropriate mix config, most likely prod:

        ```elixir
        config :mandrag,
            build_location: :remote # where to build/compile the app, :remote to build on the remote host, :local to build locally
            host: "host.com", # the host you're deploying to
            user: "user", # the name of the user on the aforementioned host
            key: "/home/user/.ssh/key.pem", # the path to the ssh key for the aforementioned user
            name: App.Mixfile.project[:app], # the name of the app you're deploying
            version: App.Mixfile.project[:version], # the version of the app you're deploying
            repo: "git@github.com:cschiewek/mandrag.git" # git path, only required i  build_location is remote
        ```
