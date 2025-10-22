defmodule ConvCase.MixProject do
  use Mix.Project

  def project do
    [
      app: :conv_case,
      version: "0.2.3",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      source_url: "https://github.com/hrzndhrn/conv_case",
      test_coverage: [tool: ExCoveralls],
      package: package(),
      dialyzer: dialyzer()
    ]
  end

  def cli do
    [
      preferred_envs: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.github": :test,
        "coveralls.html": :test
      ]
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

  defp dialyzer do
    [
      plt_file: {:no_warn, "test/support/plts/dialyzer.plt"},
      flags: [:unmatched_returns]
    ]
  end

  defp deps do
    if Version.match?(System.version(), "~> 1.14") do
      [
        {:credo, "~> 1.4", only: [:dev, :test]},
        {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
        {:ex_doc, "~> 0.22", only: :dev, runtime: false},
        {:excoveralls, "~> 0.13", only: :test},
        {:recode, "~> 0.5", only: :dev}
      ]
    else
      []
    end
  end

  defp package do
    [
      maintainers: ["Marcus Kruse"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hrzndhrn/conv_case"}
    ]
  end
end
