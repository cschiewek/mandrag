defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag
  """

  def app, do: Application.get_env(:mandrag, :app, Mix.Project.config()[:app])

  def name, do: app() |> Atom.to_string()
end
