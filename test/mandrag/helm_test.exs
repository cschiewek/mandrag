defmodule Mandrag.HelmTest do
  use ExUnit.Case, async: true
  alias Mandrag.Helm

  # no helm in docker image
  @tag :skip
  test "run", do: assert(Helm.run("help &> /dev/null") == 0)

  test "chart" do
    path = "#{System.cwd!()}/_build/test/lib/mandrag/priv/charts/phoenix"
    assert(Helm.chart() == path)
  end
end
