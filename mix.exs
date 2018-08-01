defmodule Mandrag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mandrag,
      version: "0.6.11",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Build and Deploy Elixir releases to Kubernetes via Helm",
      deps: deps(),
      package: package()
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
      {:distillery, "~> 1.5.2", runtime: false},
      {:ecto, ">= 0.0.0", optional: true},
      {:ex_doc, "~> 0.16.3", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Curtis Schiewek"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cschiewek/mandrag"}
    ]
  end
end
