defmodule Mix.Tasks.Mandrag.Docker.Build do
  use Mix.Task
  import Mandrag.Docker, only: [build_args: 0, file_path: 0, current: 0, latest: 0]
  alias Mandrag.Docker

  @shortdoc "Builds docker image that contains a release"

  def run(_) do
    formatted_build_args = Enum.map(build_args(), &format_args/1)
    Docker.run("build -f #{file_path()} #{formatted_build_args} -t #{current()} .")
    Docker.run("tag #{current()} #{latest()}")
  end

  defp format_args({key, value}), do: "--build-arg #{key}=#{value}"
end
