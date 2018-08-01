defmodule Mandrag.HelmTest do
  use ExUnit.Case, async: true
  alias Mandrag.Helm

  # no helm in docker image
  @tag :skip
  test "run", do: assert(Helm.run("help &> /dev/null") == 0)
end
