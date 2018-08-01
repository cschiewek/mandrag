defmodule Mandrag.EctoTest do
  use ExUnit.Case, async: true
  alias Mandrag.Ecto

  test "repo", do: assert(Ecto.repo() == nil)

  @tag :skip
  test "migrate", do: assert(Ecto.migrate() == nil)
end
