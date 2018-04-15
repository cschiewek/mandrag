defmodule Mandrag.Ecto do
  @moduledoc """
  Documentation for Mandrag.
  """
  import Mandrag, only: [app: 0]

  def repo, do: Application.get_env(:mandrag, :ecto_repo)

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(repo(), path, :up, all: true)
    end
  end
end
