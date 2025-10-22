defmodule ConvCaseTest do
  use ExUnit.Case
  doctest ConvCase

  import ConvCase

  describe "to_snake_case/1" do
    test "returns an empty string for an empty string" do
      assert to_snake_case("") == ""
    end

    test "converts camelCase string to snake_case" do
      assert to_snake_case("fooBar") == "foo_bar"
      assert to_snake_case("FooBar") == "foo_bar"
    end

    test "does not convert uppercase strings" do
      assert to_snake_case("HTML") == "HTML"
      assert to_snake_case("FOO_BAR") == "FOO_BAR"
    end

    test "converts kebab-case string to snake_case" do
      assert to_snake_case("foo-bar") == "foo_bar"
    end

    test "converts an atom into a string" do
      assert to_snake_case(:fooBar) == :foo_bar
    end

    test "does not convert a snake_case string" do
      assert to_snake_case("foo_bar") == "foo_bar"
    end

    test "returns values of unsupported types unconverted" do
      assert to_snake_case(42) == 42
      regex = ~r/.*/
      assert to_snake_case(regex) == regex
      map = %{~r/.*/ => 42}
      assert to_snake_case(map) == map
    end

    test "returns a list of converted values for a list" do
      assert to_snake_case(["fooBar", 33, "bAbA"]) == ["foo_bar", 33, "b_ab_a"]
    end

    test "returns a tuple of converted values for a tuple" do
      assert to_snake_case({"fooBar", "foo-bar", "foo_bar"}) ==
               {"foo_bar", "foo_bar", "foo_bar"}
    end

    test "returns a map with converted keys for a map" do
      assert to_snake_case(%{fooBar: "fooBar"}) == %{foo_bar: "fooBar"}

      assert to_snake_case(%{fooBar: %{"fooBar" => "fooBar"}}) ==
               %{foo_bar: %{"foo_bar" => "fooBar"}}

      assert to_snake_case(%{"foo-bar": [%{"baz-baz" => 42}]}) ==
               %{foo_bar: [%{"baz_baz" => 42}]}

      # Structs are ignored.
      map = %{foo_bar: ~r/.*/}
      assert to_snake_case(map) == map
    end
  end

  describe "to_camel_case/1" do
    test "returns an empty string for an empty string" do
      assert to_camel_case("") == ""
    end

    test "converts snake_case string to camelCase" do
      assert to_camel_case("foo_bar") == "fooBar"
    end

    test "converts kebab-case string to camelCase" do
      assert to_camel_case("foo-bar") == "fooBar"
    end

    test "converts an atom into a string" do
      assert to_camel_case(:foo_bar) == :fooBar
    end

    test "does not convert a camelCase string" do
      assert to_camel_case("fooBar") == "fooBar"
    end

    test "returns values of unsupported types unconverted" do
      assert to_camel_case(42) == 42
      regex = ~r/.*/
      assert to_camel_case(regex) == regex
      map = %{~r/.*/ => 42}
      assert to_camel_case(map) == map
    end

    test "returns a list of converted values for a list" do
      assert to_camel_case(["foo_bar", 33, "b_ab_a"]) == ["fooBar", 33, "bAbA"]
    end

    test "returns a tuple of converted values for a tuple" do
      assert to_camel_case({"fooBar", "foo-bar", "foo_bar"}) ==
               {"fooBar", "fooBar", "fooBar"}
    end

    test "returns a map with converted keys for a map" do
      assert to_camel_case(%{foo_bar: "foo_bar"}) == %{fooBar: "foo_bar"}

      assert to_camel_case(%{foo_bar: %{"foo-bar" => "foo-bar"}}) ==
               %{fooBar: %{"fooBar" => "foo-bar"}}

      assert to_camel_case(%{foo_bar: [%{"baz-baz" => 42}]}) ==
               %{fooBar: [%{"bazBaz" => 42}]}

      # Structs are ignored.
      map = %{fooBar: ~r/.*/}
      assert to_camel_case(map) == map
    end
  end

  describe "to_kebab_case/1" do
    test "returns an empty string for an empty string" do
      assert to_kebab_case("") == ""
    end

    test "converts snake_case string to kebab-case" do
      assert to_kebab_case("foo_bar") == "foo-bar"
    end

    test "converts camleCase string to kebab-case" do
      assert to_kebab_case("fooBar") == "foo-bar"
      assert to_kebab_case("FooBar") == "foo-bar"
    end

    test "converts an atom into a string" do
      assert to_kebab_case(:foo_bar) == :"foo-bar"
    end

    test "does not convert a kebab-case string" do
      assert to_kebab_case("foo-bar") == "foo-bar"
    end

    test "returns values of unsupported types unconverted" do
      assert to_kebab_case(42) == 42
      regex = ~r/.*/
      assert to_kebab_case(regex) == regex
      map = %{~r/.*/ => 42}
      assert to_kebab_case(map) == map
    end

    test "returns a list of converted values for a list" do
      assert to_kebab_case(["foo_bar", 33, "b_ab_a"]) ==
               ["foo-bar", 33, "b-ab-a"]
    end

    test "returns a tuple of converted values for a tuple" do
      assert to_kebab_case({"fooBar", "foo-bar", "foo_bar"}) ==
               {"foo-bar", "foo-bar", "foo-bar"}
    end

    test "returns a map with converted keys for a map" do
      assert to_kebab_case(%{foo_bar: "foo_bar"}) == %{"foo-bar": "foo_bar"}

      assert to_kebab_case(%{foo_bar: %{"fooBar" => "foo-bar"}}) ==
               %{"foo-bar": %{"foo-bar" => "foo-bar"}}

      assert to_kebab_case(%{foo_bar: [%{"baz-baz" => 42}]}) ==
               %{"foo-bar": [%{"baz-baz" => 42}]}

      # Structs are ignored.
      map = %{"foo-bar": ~r/.*/}
      assert to_kebab_case(map) == map
    end
  end
end
