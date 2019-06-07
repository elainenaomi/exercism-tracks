defmodule Roman do
  @basic_numerals %{
    { 1, 0 } => "I",
    { 5, 0 } => "V",
    { 1, 1 } => "X",
    { 5, 1 } => "L",
    { 1, 2 } => "C",
    { 5, 2 } => "D",
    { 1, 3 } => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when number <= 3000 do
    convert_digits(number)
    |> Enum.reverse
    |> Enum.join
  end

  defp reversed_digits(number) do
    number
    |> Integer.digits
    |> Enum.reverse
    |> Enum.with_index
  end

  defp convert_digits(number) do
    for { digit, position } <- reversed_digits(number) do
      diff = digit - 5

      cond do
        diff <= -2 -> String.duplicate(@basic_numerals[{1,position}], digit)
        diff == -1 -> @basic_numerals[{1,position}] <> @basic_numerals[{5,position}]
        diff == 0 -> @basic_numerals[{5,position}]
        diff > 0 && diff <= 3 -> @basic_numerals[{5,position}] <> String.duplicate(@basic_numerals[{1,position}], diff)
        diff == 4 -> @basic_numerals[{1,position}] <> @basic_numerals[{1,position+1}]
      end
    end
  end
end
