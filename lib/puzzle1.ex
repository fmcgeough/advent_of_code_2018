defmodule Puzzle1 do
  @moduledoc """
  read integer changes in frequency and produce final result
  """

  @doc """
  Hello world.

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

  def convert_to_integers(file) do
    file
    |> File.read()
    |> case do
      {:ok, data} ->
        String.split(data, "\n")
        |> Enum.filter(fn str -> str != "" end)
        |> Enum.map(fn str -> String.to_integer(str) end)

      _ ->
        []
    end
  end
end
