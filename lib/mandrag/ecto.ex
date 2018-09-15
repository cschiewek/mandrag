defmodule Mandrag.Ecto do
  @moduledoc """
  Documentation for Mandrag.
  """
  import Mandrag, only: [app: 0]

  def repo, do: Application.get_env(app(), :ecto_repos)

  def migrate do
    if repo() && function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Enum.map(repo(), &Ecto.Migrator.run(&1, path, :up, all: true))
    end
  end
end
