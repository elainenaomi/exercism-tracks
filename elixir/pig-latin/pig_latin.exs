require IEx

defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&PigLatin.translate_word/1)
    |> Enum.join(" ")
  end

  def translate_word(word) do
    word
    |> transform_consonants
    |> Kernel.<>("ay")
  end

  defp transform_consonants(word) do
    consonants = Regex.run(~r/^(ch|qu|squ|thr|th|sch|[^aeiouyx]+|(x|y)(?=[aeiou]))/, word)

    if consonants do
      last_position = consonants |> Enum.at(0) |> String.length
      String.slice(word, last_position..-1) <> String.slice(word, 0..last_position-1)
    else
      word
    end
  end
end
