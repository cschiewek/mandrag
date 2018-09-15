defmodule Mandrag.Ecto do
  @moduledoc """
  Documentation for Mandrag.
  """
  import Mandrag, only: [app: 0]

  def repo, do: Application.get_env(:mandrag, :ecto_repo, default_repo())

  defp default_repo do
    module = app() |> Atom.to_string |> String.capitalize
    String.to_existing_atom("#{module}.Repo")
  rescue
    ArgumentError -> nil
  end

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(repo(), path, :up, all: true)
    end
  end
end
