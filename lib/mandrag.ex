defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  def docker_repo, do: Application.get_env(:mandrag, :image, "docker/#{name()}")

  def app, do: Application.get_env(:mandrag, :app, Mix.Project.config()[:version])

  def name, do: app() |> Atom.to_string()

  def docker(args), do: Mix.Shell.IO.cmd("docker " <> args)

  def latest, do: "#{docker_repo()}:latest"

  def tag, do: Mix.Project.config()[:version]

  def current, do: "#{docker_repo()}:#{tag()}"

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(ecto_repo(), path, :up, all: true)
    end
  end

  defp ecto_repo, do: Application.get_env(:mandrag, :repo)
end
