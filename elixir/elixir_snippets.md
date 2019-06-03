# Elixir snippets

## shorthand for functions

```elixir
sum_func = fn(a,b) -> a + b end
sum_func = &(&1 + &2)

sum_func.(1,2)
```

## Enum

```elixir
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end);
Enum.all?(["foo", "bar", "hello"], &(String.length(&1) ==3));
Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)
```

```
Enum.reduce(
  [1, "not a number", 2, :x, 3],
  0,
  fn element, sum
    when is_number(element) -> sum + element
    _, sum -> sum
  end
)
```

### Guard clauses

```elixir
defmodule TestNum do
  def test(x) when is_number(x) and x < 0 do
    :negative
  end
  def test(0), do: :zero
  def test(x) when is_number(x) and x > 0 do
    :positive
  end
end

def empty_map?(map) when map_size(map) == 0, do: true
def empty_map?(map) when is_map(map), do: false
```

## Recursive functions

```
defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end

defmodule Fact do
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end

defmodule NaturalNums do
  def print(1), do: IO.puts(1)
  def print(n) do
    print(n - 1)
    IO.puts(n)
  end
end
```
# ETS

```
 def histogram(strand) do
    :ets.new(:histogram, [:set, :public, :named_table]) # create a table named :histogram

    Enum.each(@nucleotides, fn nucleotide ->
      :ets.insert(:histogram, {nucleotide, 0})
    end)

    Enum.each(strand, fn nucleotide ->
      :ets.update_counter(:histogram, nucleotide, 1) # works because it's only a counter
    end)

    Map.new(@nucleotides, fn nucleotide ->
      hd(:ets.lookup(:histogram, nucleotide)) # lookup returns something like [{65, 3}]
    end)
  end
```
