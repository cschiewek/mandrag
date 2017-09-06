defmodule Mix.Tasks.Mandrag.Set do
  use Mix.Task
  import Mandrag, only: [kubectl: 1, current: 0, name: 0]
  @shortdoc "Sets the image"

  def run(_) do
    command = "set image deployment/#{name()} #{name()}=#{current()}"
    IO.puts "kubectl #{command}"
    kubectl command
  end
 end
