defmodule Mix.Tasks.Mandrag.Docker.Build do
  use Mix.Task
  import Mandrag.Docker, only: [file_path: 0, current: 0, latest: 0]
  alias Mandrag.Docker

  @shortdoc "Builds docker image that contains a release"

  def run(_) do
    Docker.run("build -f #{file_path()} -t #{current()} .")
    Docker.run("tag #{current()} #{latest()}")
  end
end
