defmodule Mix.Tasks.Mandrag.Helm.Upgrade do
  use Mix.Task
  import Mandrag, only: [name: 0]
  import Mandrag.Docker, only: [tag: 0]
  alias Mandrag.Helm

  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    formatted_name = name() |> Helm.format_name()
    Helm.run("init --upgrade --wait")
    Helm.run("dep build  #{Helm.chart()}")
    Helm.run("upgrade --install --namespace #{formatted_name} --set image.tag=#{tag()} #{formatted_name} #{Helm.chart()}")
  end
end
