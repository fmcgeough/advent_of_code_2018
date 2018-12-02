defmodule FileInput do
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
