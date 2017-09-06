defmodule Mix.Tasks.Mandrag.DeployAndMigrate do
  use Mix.Task
  @shortdoc "Deploys then runs migrations"

  def run(_) do
    Mix.Task.run "mandrag.deploy"
    Mix.Task.run "mandrag.migrate"
  end
end
