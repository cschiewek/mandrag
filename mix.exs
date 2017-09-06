defmodule Mandrag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mandrag,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: "Deploy Elixir releases to Kubernetes",
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
      {:distillery, "~> 1.5.1"},
      {:ecto, ">= 0.0.0", optional: true},
      {:ex_doc, "~> 0.16.3", only: :dev}
    ]
  end

  defp package do
    [maintainers: ["Curtis Schiewek"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/cschiewek/mandrag"}]
  end
end
