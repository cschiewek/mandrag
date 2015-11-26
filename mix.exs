defmodule Mandrag.Mixfile do
  use Mix.Project

  def project do
    [app: :mandrag,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: "A simple, extremely assumptive deploy script for Phoenix apps",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  defp deps do
    [{:exrm, "~> 1.0.0-rc5"}]
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Curtis Schiewek"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/cschiewek/mandrag"]
  end
end
