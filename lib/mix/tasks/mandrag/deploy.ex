defmodule Mix.Tasks.Mandrag.Deploy do
  use Mix.Task
  @shortdoc "Runs build, push, and apply, effectively building a releasing, pushing the image, and installing/updating your helm relase."

  def run(_) do
    Mix.Task.run("mandrag.build")
    Mix.Task.run("mandrag.push")
    Mix.Task.run("mandrag.apply")
  end
end
