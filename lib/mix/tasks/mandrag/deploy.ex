defmodule Mix.Tasks.Mandrag.Deploy do
  use Mix.Task
  @shortdoc "Deploys image that contains a release"

  def run(_) do
    Mix.Task.run "mandrag.build"
    Mix.Task.run "mandrag.push"
    Mix.Task.run "mandrag.helm"
  end
end
