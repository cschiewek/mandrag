defmodule Mix.Tasks.Mandrag.Deploy do
  use Mix.Task

  @shortdoc "Runs build, push, and upgrade, effectively building a release, pushing the image, and installing/updating your helm relase."

  def run(_) do
    Mix.Task.run("mandrag.docker.build")
    Mix.Task.run("mandrag.docker.push")
    Mix.Task.run("mandrag.helm.upgrade")
  end
end
