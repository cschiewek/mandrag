defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  # Config
  def app, do: Application.get_env(:mandrag, :app, Mix.Project.config()[:app])

  def docker_repo, do: Application.get_env(:mandrag, :image, "docker/#{name()}")

  def docker_build_args do
    Map.merge(Application.get_env(:mandrag, :docker_build_args, %{}), %{name: app()})
  end

  def dockerfile_path do
    Application.get_env(
      :mandrag,
      :dockerfile_path,
      Path.join(:code.priv_dir(:mandrag), "Dockerfile")
    )
  end

  def tag, do: Mix.Project.config()[:version]

  def ecto_repo, do: Application.get_env(:mandrag, :repo)

  # Helpers
  def current, do: "#{docker_repo()}:#{tag()}"

  def docker(args), do: Mix.Shell.IO.cmd("docker " <> args)

  def latest, do: "#{docker_repo()}:latest"

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(ecto_repo(), path, :up, all: true)
    end
  end

  def name, do: app() |> Atom.to_string()
end
