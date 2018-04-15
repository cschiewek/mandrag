defmodule Mix.Tasks.Mandrag.Helm.Delete do
  use Mix.Task
  alias Mandrag.Helm
  import Mandrag, only: [name: 0]

  @shortdoc "Runs helm delete"

  def run(_) do
    Helm.run("delete #{name()} --purge")
  end
end
