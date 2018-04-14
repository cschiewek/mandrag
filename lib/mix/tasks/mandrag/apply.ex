defmodule Mix.Tasks.Mandrag.Apply do
  use Mix.Task
  import Mandrag, only: [current: 0, name: 0]
  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    Mix.Shell.IO.cmd "helm upgrade --install --set image.tag=#{current()} #{name()} ./chart "
  end
end
