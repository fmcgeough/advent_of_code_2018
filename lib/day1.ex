defmodule Day1 do
  @moduledoc """
  read integer changes in frequency and produce final result
  """

  @doc """
  Find the final frequency based on List of integer values

  ## Examples

      iex> Day1.resulting_frequency([1, 1, 1])
      3

      iex> Day1.resulting_frequency([1, 1, -2])
      0

      iex> Day1.resulting_frequency([-1, -2, -3])
      -6
  """
  def resulting_frequency(data) do
    data
    |> Enum.sum()
  end

  @doc """
  Find the first dupe result

  ## Examples

      iex> Day1.first_frequency_hit_twice([+1, -1])
      0

      iex> Day1.first_frequency_hit_twice([+3, +3, +4, -2, -4])
      10

      iex> Day1.first_frequency_hit_twice([-6, +3, +8, +5, -6])
      5

      iex> Day1.first_frequency_hit_twice([+7, +7, -2, -7, -4])
      14

  """
  def first_frequency_hit_twice(data) do
    eval({MapSet.new([0]), 0}, data)
  end

  defp eval({:found, repeat_frequency}, _data), do: repeat_frequency

  defp eval({used_values, acc}, data) do
    data
    |> Enum.reduce_while({used_values, acc}, fn x, {used_values, acc} ->
      new_frequency = acc + x

      case MapSet.member?(used_values, new_frequency) do
        true -> {:halt, {:found, new_frequency}}
        false -> {:cont, {MapSet.put(used_values, new_frequency), new_frequency}}
      end
    end)
    |> eval(data)
  end
end
