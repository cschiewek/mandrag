defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  def image, do: Application.get_env(:mandrag, :image, name())

  def app, do: Application.get_env(:mandrag, :app)

  defp repo, do: Application.get_env(:mandrag, :repo)

  def name, do: app() |> Atom.to_string

  def docker(args), do: Mix.Shell.IO.cmd("docker " <> args)

  def latest, do: "#{image()}:latest"

  def current, do: "#{image()}:#{Mix.Project.config[:version]}"

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(repo(), path, :up, all: true)
    end
  end
end
