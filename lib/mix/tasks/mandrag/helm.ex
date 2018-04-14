defmodule Mix.Tasks.Mandrag.UpdateKube do
  use Mix.Task
  import Mandrag, only: [kubectl: 1, current: 0, name: 0, kube_config: 0]
  @shortdoc "Sets the image"

  def run(_) do
    helm "upgrade --install --set image.tag=#{current()} #{name()} ./chart "
  end
end
