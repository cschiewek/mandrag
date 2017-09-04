defmodule Mandrag do
  @moduledoc """
  Documentation for Mandrag.
  """

  def image, do: Application.get_env(:mandrag, :image) || name()

  defp name, do: Mix.Project.config[:app] |> Atom.to_string

  defp exec(command, args), do: System.cmd(command, args, into: IO.stream(:stdio, :line))

  def docker(args), do: exec("docker", args)

  def kubectl(args), do: exec("kubectl", args)

  def latest, do: "#{image()}:latest"

  def current, do: "#{image()}:#{Mix.Project.config[:version]}"

  def pod do
    {output, _} = System.cmd("kubectl", ~w"get pods")
    output |> String.split("\n") |> Enum.find(&match/1) |> pod_name
  end

  defp match(line), do: line =~ name()

  defp pod_name(nil), do: nil
  defp pod_name(pod_line), do: pod_line |> String.split(" ") |> Enum.at(0)
end
