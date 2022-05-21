defmodule Exnowflake.MixProject do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :exnowflake,
      version: @version,
      description: "Unique, time based ID generation inspired by Twitter's Snowflake.",
      package: package(),
      source_url: "https://github.com/pggalaviz/exnowflake",
      homepage_url: "https://github.com/pggalaviz/exnowflake",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      aliases: [
        bench: "run benchmarks/main.exs",
        check: ["dialyzer --format dialyxir"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Exnowflake.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:redix, "~> 1.1"},
      # Benchmarking dependencies
      {:benchee, "~> 1.1", only: [:dev]},
      # Code Analysis
      {:dialyxir, "~> 1.1", optional: true, only: [:dev], runtime: false},
      # Docs
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :exnowflake,
      maintainers: ["Pedro G. Galaviz (hello@pggalaviz.com)"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pggalaviz/exnowflake"},
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/exnowflake",
      source_url: "https://github.com/pggalaviz/exnowflake",
      extras: [
        "README.md"
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
