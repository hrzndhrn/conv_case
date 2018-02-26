# ConvCase
[![Build Status](https://travis-ci.org/hrzndhrn/conv_case.svg?branch=master)](https://travis-ci.org/hrzndhrn/conv_case)
[![Coverage Status](https://coveralls.io/repos/github/hrzndhrn/conv_case/badge.svg?branch=master)](https://coveralls.io/github/hrzndhrn/conv_case?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/v/conv_case.svg)](https://hex.pm/packages/conv_case)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A library to convert strings, atoms and map keys between `camelCase`,
`snake_case` and `kebab-case`.

## Installation

The package can be installed by adding `conv_case` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:conv_case, "~> 0.1.0"}
  ]
end
```

Documentation can be found at https://hexdocs.pm/conv_case.

## Alternatives

If this package fits not your requirements then take a look here:

  * [Macro.camelize/1](https://hexdocs.pm/elixir/Macro.html#camelize/1) and
    [Macro.underscore/1](https://hexdocs.pm/elixir/Macro.html#underscore/1)
  * [ReCase](https://github.com/sobolevn/recase) helps you to convert a string
    from any case to any case.
  * [ProperCase](https://github.com/johnnyji/proper_case) an Elixir library that
    converts keys in maps between snake_case and camel_case.



