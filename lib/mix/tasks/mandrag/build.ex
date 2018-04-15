defmodule Mix.Tasks.Mandrag.Build do
  use Mix.Task

  import Mandrag,
    only: [docker: 1, docker_build_args: 0, dockerfile_path: 0, current: 0, latest: 0]

  @shortdoc "Builds docker image that contains a release"

  def run(_) do
    build_args = Enum.map(docker_build_args(), &format_args/1)
    docker("build -f #{dockerfile_path()} #{build_args} -t #{current()} .")
    docker("tag #{current()} #{latest()}")
  end

  defp format_args({key, value}), do: "--build-arg #{key}=#{value}"
end
