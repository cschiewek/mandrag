defmodule Mix.Tasks.Mandrag.Helm.Upgrade do
  use Mix.Task
  import Mandrag, only: [name: 0]
  import Mandrag.Docker, only: [tag: 0]
  alias Mandrag.Helm

  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    Helm.run("upgrade --install --namespace #{name()} --set image.tag=#{tag()} #{name()} ./charts/#{name()}")
  end
end
