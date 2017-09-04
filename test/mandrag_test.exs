defmodule MandragTest do
  use ExUnit.Case

  test "image" do
    assert Mandrag.image == "mandrag"
  end

  test "latest" do
    assert Mandrag.latest == "mandrag:latest"
  end

  test "current" do
    assert Mandrag.current == "mandrag:#{Mix.Project.config[:version]}"
  end
end
