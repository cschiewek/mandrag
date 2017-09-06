defmodule Mix.Tasks.Mandrag.Build do
  use Mix.Task
  import Mandrag, only: [docker: 1, current: 0, latest: 0]
  @shortdoc "Builds docker image that contains a release"

  def run(_) do
    docker "build -t #{current()} ."
    docker "tag #{current()} #{latest()}"
  end
end
