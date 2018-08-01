defmodule MandragTest do
  use ExUnit.Case, async: true

  describe "with defaults, no ecto" do
    test "app", do: assert(Mandrag.app == :mandrag)
    test "name", do: assert(Mandrag.name == "mandrag")
  end
end
