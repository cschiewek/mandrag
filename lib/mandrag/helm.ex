defmodule Mandrag.Helm do
  @moduledoc """
  Documentation for Mandrag.Helm
  """
  def context do
    case Application.get_env(:mandrag, :k8s_context) do
      nil -> ""
      context -> "--kube-context #{context}"
    end
  end

  def run(args), do: Mix.Shell.IO.cmd("helm #{context()} #{args}")

  def chart do
    Application.get_env(
      :mandrag,
      :chart_path,
      Path.join(:code.priv_dir(:mandrag), "charts/phoenix")
    )
  end

  def format_name(name), do: String.replace(name, "_", "-")

  def host do
    Mandrag.app()
    |> Application.get_all_env
    |> Enum.find(&(&1 |> elem(0) |> Atom.to_string =~ ~r/Endpoint/))
    |> elem(1)
    |> Keyword.get(:url)
    |> Keyword.get(:host)
  end
end
