if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("hello_world.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule HelloWorldTest do
  use ExUnit.Case

  test "says hello with no name" do
    assert HelloWorld.hello() == "Hello, World!"
  end

<<<<<<< HEAD
=======
  @tag :pending
>>>>>>> df7734b7d70b9ca605d15306554fdb26d642555e
  test "says hello sample name" do
    assert HelloWorld.hello("Alice") == "Hello, Alice!"
  end

<<<<<<< HEAD
=======
  @tag :pending
>>>>>>> df7734b7d70b9ca605d15306554fdb26d642555e
  test "says hello other sample name" do
    assert HelloWorld.hello("Bob") == "Hello, Bob!"
  end

end
