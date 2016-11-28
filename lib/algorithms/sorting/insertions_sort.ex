defmodule Algorithms.Sorting.InsertionSort do

  def sort(list), do: Enum.reduce(list, [], &insert/2)
  defp insert(x, []), do: [x]
  defp insert(x, [h | rest]) when x < h, do: [x, h | rest]
  defp insert(x, [h | rest]), do: [h | insert(x, rest)]

  #def sort(list), do: sort_list(list, [])

  #def sort_list([], acc), do: acc
  #def sort_list([h | tail], []), do: sort_list(tail, [h])
  #def sort_list([h | tail], acc = [h | acc_tail]), do: sort_list(tail, [h | acc])
  #def sort_list([h | tail], acc = [x | acc_tail]) when h < x, do: sort_list(tail, [h | acc])
  #def sort_list([h | tail], acc = [x | acc_tail]) when h > x, do: sort_list(tail, [ x | sort_list([h], acc_tail) ])
end
