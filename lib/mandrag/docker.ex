defmodule Mandrag.Docker do
  @moduledoc """
  Documentation for Mandrag.Docker
  """
  import Mandrag, only: [name: 0]

  def repo, do: Application.get_env(:mandrag, :image, "docker/#{name()}")

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
end
