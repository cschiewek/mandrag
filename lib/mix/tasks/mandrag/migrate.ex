defmodule Mix.Tasks.Mandrag.Migrate do
  use Mix.Task
  import Mandrag, only: [kubectl: 1, pod: 0, name: 0]
  @shortdoc "Runs the migrations"

  def run(_) do
    kubectl "exec #{pod()} bin/#{name()} rpc Mandrag migrate"
  end
 end
