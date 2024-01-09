defmodule LittleProjects.MixProject do
  use Mix.Project

  def project do
    [
      app: :little_projects,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
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
      {:pushover, "~> 0.3.3"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"},
      {:tesla, "~> 1.4", override: true},
      {:mastodon_client, "~> 0.1.0"},
    ]
  end
end
