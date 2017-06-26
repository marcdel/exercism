defmodule SecretHandshake do
  use Bitwise

  @actions [
    { 0b1, "wink" },
    { 0b10, "double blink" },
    { 0b100, "close your eyes" },
    { 0b1000, "jump" }
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> find_matching_actions
    |> Enum.unzip
    |> reverse_if_necessary(code)
  end

  def find_matching_actions(code) do
      Enum.filter(@actions, fn {command, _} -> (code &&& command) > 0 end)
  end

  def reverse_if_necessary({_binary, actions}, code) do
    if (code &&& 0b10000) > 0 do
      Enum.reverse actions
    else
      actions
    end
  end
end
