defmodule MandragTest do
  use ExUnit.Case

  test "app" do
    assert Mandrag.app == :mandrag
  end

  test "name" do
    assert Mandrag.name == "mandrag"
  end
end
