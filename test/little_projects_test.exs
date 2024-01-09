defmodule LittleProjectsTest do
  use ExUnit.Case
  doctest LittleProjects

  test "greets the world" do
    assert LittleProjects.hello() == :world
  end
end
