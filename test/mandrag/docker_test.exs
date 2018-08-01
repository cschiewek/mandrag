defmodule Mandrag.DockerTest do
  use ExUnit.Case, async: true
  alias Mandrag.Docker

  @current_version Mix.Project.config()[:version]

  test "repo", do: assert(Docker.repo() == "mandrag")

  test "build_args", do: assert(Docker.build_args() == %{name: :mandrag})

  test "file_path" do
    path = "#{System.cwd!()}/_build/test/lib/mandrag/priv/Dockerfile"
    assert Docker.file_path() == path
  end

  test "tag", do: assert(Docker.tag() == @current_version)

  test "current", do: assert(Docker.current() == "mandrag:#{@current_version}")

  # no docker in docker image
  @tag :skip
  test "run", do: assert(Docker.run("help &> /dev/null") == 0)

  test "latest", do: assert(Docker.latest() == "mandrag:latest")

  test "export" do
    assert Docker.export() == 702
    assert File.exists?("Dockerfile")
    File.rm!("Dockerfile")
  end
end
