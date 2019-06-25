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
end
