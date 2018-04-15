defmodule Mix.Tasks.Mandrag.Docker.Push do
  use Mix.Task
  alias Mandrag.Docker
  import Mandrag.Docker, only: [current: 0, latest: 0]

  @shortdoc "Pushes docker images"

  def run(_) do
    Docker.run("push #{current()}")
    Docker.run("push #{latest()}")
  end
end
