defmodule Mandrag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mandrag,
      version: "1.0.0-pre.1",
      elixir: "~> 1.9",
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
      {:ex_doc, "~> 0.19.1", only: :dev}
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
