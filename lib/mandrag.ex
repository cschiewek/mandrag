defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  # Config
  def app, do: Application.get_env(:mandrag, :app, Mix.Project.config()[:app])

  def ecto_repo, do: Application.get_env(:mandrag, :repo)

  # Helpers
  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(ecto_repo(), path, :up, all: true)
    end
  end

  def name, do: app() |> Atom.to_string()
end
