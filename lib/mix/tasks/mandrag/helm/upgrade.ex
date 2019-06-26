defmodule Mix.Tasks.Mandrag.Helm.Upgrade do
  use Mix.Task
  import Mandrag, only: [name: 0]
  import Mandrag.Docker, only: [repo: 0, tag: 0]
  alias Mandrag.Helm

  @shortdoc "Runs helm upgrade/install"

  def run(_) do
    formatted_name = name() |> Helm.format_name()
    Helm.run("init --upgrade --wait")
    Helm.run("dep build  #{Helm.chart()}")

    Helm.run(
      "upgrade --install --namespace #{formatted_name} \
       --set image.repository=#{repo()} \
       --set image.tag=#{tag()} \
       --set ingress.hosts={#{Helm.host()}} \
      #{formatted_name} #{Helm.chart()}"
    )
  end
end
