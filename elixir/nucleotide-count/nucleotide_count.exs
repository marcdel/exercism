defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    matches = Enum.filter(strand, fn(letter) -> letter == nucleotide end)
    Enum.count(matches)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    totals = Map.new(@nucleotides, fn nucleotide -> {nucleotide, 0} end)
    Enum.reduce(strand, totals, fn(nucleotide, acc) ->
      Map.update(acc, nucleotide, 1, &(&1 + 1))
    end)
  end
end
