defmodule Mandrag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mandrag,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: "Deploy Elixir releases to Kubernetes",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 1.5.1"}
    ]
  end
end
