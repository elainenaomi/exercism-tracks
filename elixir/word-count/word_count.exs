defmodule Words do
  @pattern ~r/[a-zA-Z0-9-\p{L}]+/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    @pattern
    |> Regex.scan(sentence)
    |> Enum.reduce(%{}, fn([word], acc) ->
      Map.update(acc, String.downcase(word), 1, &(&1 + 1))
    end)
  end
end
