defmodule Mandrag.EctoTest do
  use ExUnit.Case
  alias Mandrag.Ecto

  test "repo" do
    assert Ecto.repo() == nil
  end

  test "migrate" do
    assert Ecto.migrate() == nil
  end
end
