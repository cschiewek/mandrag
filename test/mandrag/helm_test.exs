defmodule Mandrag.HelmTest do
  use ExUnit.Case, async: true
  alias Mandrag.Helm

  test "context", do: assert(Helm.context() == "")

  @tag :skip  # no helm in docker image
  test "run", do: assert(Helm.run("help &> /dev/null") == 0)
end
