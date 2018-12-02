defmodule Puzzle1 do
  @moduledoc """
  read integer changes in frequency and produce final result
  """

  @doc """
  Find the final frequency based on List of integer values

  ## Examples

      iex> Puzzle1.resulting_frequence([1, 1, 1])
      3

      iex> Puzzle1.resulting_frequence([1, 1, -2])
      0

      iex> Puzzle1.resulting_frequence([-1, -2, -3])
      -6
  """
  def resulting_frequency(data) do
    data
    |> Enum.reduce(0, fn x, acc -> acc + x end)
  end
end
