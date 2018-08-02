defmodule Mandrag.Helm do
  @moduledoc """
  Documentation for Mandrag.Helm
  """

  def run(args), do: Mix.Shell.IO.cmd("helm " <> args)

  def chart do
    Application.get_env(
      :mandrag,
      :chart,
      Path.join(:code.priv_dir(:mandrag), "charts/phoenix")
    )
  end
end
