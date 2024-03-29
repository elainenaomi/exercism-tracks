defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.filter(fn x -> x == nucleotide end) # &(&1 == nucleotide)
    |> Enum.count
    # Alternative:
    # Enum.count(strand, &(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(
      strand,
      Map.new(@nucleotides, &{&1, 0}),
      fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end
    )

    # Alternatives:

    # @nucleotides
    # |> Enum.map(fn k -> {k, count(strand,k)} end) # tuple
    # |> Enum.into(%{}) # map

    # Map.new(@nucleotides, &{&1, count(strand, &1)})
  end
end
