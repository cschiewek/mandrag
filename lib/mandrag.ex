defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  def image, do: Application.get_env(:mandrag, :image) || Mix.Project.config[:app] |> Atom.to_string

  defp exec(command, args), do: System.cmd(command, args, into: IO.stream(:stdio, :line))

  def docker(args), do: exec("docker", args)

  def kubectl(args), do: exec("kubectl", args)

  def latest, do: "#{image()}:latest"

  def current, do: "#{image()}:#{Mix.Project.config[:version]}"

  # defp pod do
  #   {output, _} = System.cmd("kubectl", ~w(get pods))
  #   output |> String.split("\n") |> Enum.at(1) |> String.split(" ") |> Enum.at(0)
  # end
end
