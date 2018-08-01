defmodule Mandrag.Docker do
  @moduledoc """
  Documentation for Mandrag.Docker
  """
  import Mandrag, only: [app: 0, name: 0]

  def repo, do: Application.get_env(:mandrag, :docker_repo, "docker/#{name()}")

  def build_args do
    Map.merge(Application.get_env(:mandrag, :docker_build_args, %{}), %{name: app()})
  end

  def file_path do
    Application.get_env(
      :mandrag,
      :dockerfile_path,
      Path.join(:code.priv_dir(:mandrag), "Dockerfile")
    )
  end

  def tag, do: Mix.Project.config()[:version]

  def current, do: "#{repo()}:#{tag()}"

  def run(args), do: Mix.Shell.IO.cmd("docker " <> args)

  def latest, do: "#{repo()}:latest"

  def export do
    File.copy!(file_path(), "Dockerfile")
  end
end
