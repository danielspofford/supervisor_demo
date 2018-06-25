defmodule SupervisorDemoTest do
  use ExUnit.Case
  doctest SupervisorDemo

  test "greets the world" do
    assert SupervisorDemo.hello() == :world
  end
end
