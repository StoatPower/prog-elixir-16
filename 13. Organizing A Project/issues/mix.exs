defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,      
      version: "0.1.0",
      name: "ISsues",
      elixir: "~> 1.10",
      escript: escript_config(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      { :httpoison, "~> 1.7.0" },
      { :poison, "~> 4.0.1" },
      { :ex_doc, "~> 0.22.2" },
      { :earmark, "~> 1.4.10", override: true},
      { :excoveralls, "~> 0.13.1", only: :test}
    ]
  end

  defp escript_config do
    [
      main_module: Issues.CLI
    ]
  end
end
