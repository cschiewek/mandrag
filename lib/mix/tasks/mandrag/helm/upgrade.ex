defmodule Mix.Tasks.Mandrag.Helm.Upgrade do
  use Mix.Task
  import Mandrag, only: [name: 0]
  import Mandrag.Docker, only: [tag: 0]
  alias Mandrag.Helm

  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    Helm.run("upgrade --install --set image.tag=#{tag()} #{name()} #{Helm.chart()}")
  end
end
