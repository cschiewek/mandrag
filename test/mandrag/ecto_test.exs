defmodule Mandrag.EctoTest do
  use ExUnit.Case, async: true
  alias Mandrag.Ecto

  test "repos", do: assert(Ecto.repos() == nil)

  @tag :skip
  test "migrate", do: assert(Ecto.migrate() == nil)
end
