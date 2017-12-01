defmodule Mix.Tasks.Mandrag.Set do
  use Mix.Task
  import Mandrag, only: [kubectl: 1, current: 0, name: 0, kube_config: 0]
  @shortdoc "Sets the image"

  def run(_) do
    if File.exists?(kube_config()), do: kubectl "apply -f #{kubconfig}"
    kubectl "set image deployment/#{name()} #{name()}=#{current()}"
  end
end
