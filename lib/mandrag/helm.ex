defmodule Mandrag.Helm do
  @moduledoc """
  Documentation for Mandrag.Helm
  """

  def run(args), do: Mix.Shell.IO.cmd("helm " <> args)
end
