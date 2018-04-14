defmodule Mix.Tasks.Mandrag.Push do
  use Mix.Task
  import Mandrag, only: [docker: 1, current: 0, latest: 0]
  @shortdoc "Pushes docker images"

  def run(_) do
    docker("push #{current()}")
    docker("push #{latest()}")
  end
end
