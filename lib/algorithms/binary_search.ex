defmodule Algorithms.BinarySearch do

  @moduledoc """
  Searches a list of values in order to find a value.


  """

  def find(list, value) do
    cond do
      List.last(list) < value -> {:ok}
      true -> search(list, value, 0, length(list), 0)
    end
  end

  defp search([], _value, _min, _max, _acc), do: nil
  defp search([_x], _value, _min, _max, _acc), do: 0
  defp search(list, val, min, max, _acc) when max < min, do: 0
  defp search(list, value, min, max, acc) do
    mid = div(min + max, 2)
    {_, val} = 
       list
       |> Enum.fetch(mid)

    cond do
      val > value -> 
        search(list, value, min, mid - 1, acc + 1)
      val < value -> 
        search(list, value, mid + 1, max, acc + 1)
      true -> 
        IO.puts "Value #{value} is at index #{mid}. Found in #{acc + 1} steps"
    end
  end

end
