```
  @rna_from_dna %{
    ?A => ?U,
    ?C => ?G,
    ?T => ?A,
    ?G => ?C
  }

  def to_rna(dna) do
    Enum.map(dna, fn nucleotide -> @rna_from_dna[nucleotide] end)
  end
```

```
  def to_rna(dna) do
    Enum.map(dna, &dna_to_rna/1)
  end

  @rna_from_dna %{
    ?A => ?U,
    ?C => ?G,
    ?T => ?A,
    ?G => ?C
  }
  def dna_to_rna(nucleotide) do
    @rna_from_dna[nucleotide]
  end
```

```
  def to_rna(?A), do: ?U
  def to_rna(?C), do: ?G
  def to_rna(?T), do: ?A
  def to_rna(?G), do: ?C
  def to_rna(dna) do
    Enum.map(dna, &to_rna/1)
  end
```
