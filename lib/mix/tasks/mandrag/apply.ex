defmodule Mix.Tasks.Mandrag.Apply do
  use Mix.Task
  import Mandrag, only: [tag: 0, name: 0]
  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    Mix.Shell.IO.cmd("helm upgrade --install --set image.tag=#{tag()} #{name()} ./chart")
  end
end
