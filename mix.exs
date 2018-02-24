defmodule ConvCase.MixProject do
  use Mix.Project

  def project do
    [
      app: :conv_case,
      version: "0.2.2",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      source_url: "https://github.com/hrzndhrn/conv_case",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      package: package()
    ]
  end

  def description do
    """
    A library to convert strings, atoms and map keys between `camelCase`,
    `snake_case` and `kebab-case`.
    """
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.7", only: :test},
      {:inch_ex, "~> 0.5", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: ["Marcus Kruse"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hrzndhrn/conv_case"}
    ]
  end
end
