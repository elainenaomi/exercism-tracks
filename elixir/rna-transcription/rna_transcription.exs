defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna('A'), do: 'U'
  def to_rna('C'), do: 'G'
  def to_rna('T'), do: 'A'
  def to_rna('G'), do: 'C'
  def to_rna(dna) do
    [ head | tail ] = dna
    to_rna([head]) ++ to_rna(tail)
  end
end
