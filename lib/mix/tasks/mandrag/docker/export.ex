defmodule Mix.Tasks.Mandrag.Docker.Export do
  use Mix.Task
  alias Mandrag.Docker

  @shortdoc "Exports mandrags default Dockerfile to your app root"

  def run(_) do
    Docker.export()
    IO.puts """

    If you want to use this newly exported Dockferfile with mandrag, don't forget to set it in your config:

    `config :mandrag, dockerfile_path: "Dockerfile"`
    """
  end
end
