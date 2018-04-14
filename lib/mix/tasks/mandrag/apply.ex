defmodule Mix.Tasks.Mandrag.UpdateKube do
  use Mix.Task
  import Mandrag, only: [helm: 1, current: 0, name: 0]
  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    helm "upgrade --install --set image.tag=#{current()} #{name()} ./chart "
  end
end
