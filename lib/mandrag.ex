defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  def image, do: Application.get_env(:mandrag, :image, name())

  def app, do: Application.get_env(:mandrag, :app)

  defp repo, do: Application.get_env(:mandrag, :repo)

  def name, do: app() |> Atom.to_string

  def docker(args), do: Mix.Shell.IO.cmd("docker " <> args)

  def helm(args), do: Mix.Shell.IO.cmd("helm " <> args)

  def latest, do: "#{image()}:latest"

  def current, do: "#{image()}:#{Mix.Project.config[:version]}"

  def pod do
    {output, _} = System.cmd("kubectl", ~w"get pods")
    output |> String.split("\n") |> Enum.find(&match/1) |> pod_name
  end

  def migrate do
    if function_exported?(Ecto.Migrator, :run, 4) do
      {:ok, _} = Application.ensure_all_started(app())
      path = Application.app_dir(app(), "priv/repo/migrations")
      Ecto.Migrator.run(repo(), path, :up, all: true)
    end
  end

  defp match(line), do: line =~ name()

  defp pod_name(nil), do: nil
  defp pod_name(pod_line), do: pod_line |> String.split(" ") |> Enum.at(0)
end
