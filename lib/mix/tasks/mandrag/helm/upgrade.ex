defmodule Mix.Tasks.Mandrag.Helm.Upgrade do
  use Mix.Task
  import Mandrag, only: [name: 0]
  import Mandrag.Docker, only: [tag: 0]
  alias Mandrag.Helm

  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    Helm.run("upgrade --install --namespace #{formatted_name()} --set image.tag=#{tag()} #{formatted_name()} #{Helm.chart()}")
  end

  defp formatted_name, do: name() |> String.replace("_", "-")
end
