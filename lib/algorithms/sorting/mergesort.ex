defmodule Algorithms.Sorting.Mergesort do

#  ---------- FIRST IMPLEMENTATION -> 7 SECONDS
#  def sort([]), do: []
#  def sort([a]), do: [a]
#  def sort([a,b]) when a <= b, do: [a,b]
#  def sort([a,b]), do: [b,a]
#  def sort([a, b | tail]), do: sort([a,b]) |> merge(sort(tail))

#  def merge(list, []), do: list
#  def merge([], list), do: list
#  def merge([a | tail1], [b | tail2]) when a <= b, do: [a | merge(tail1, [b | tail2]) ]
#  def merge(list1, [b | tail]), do: [b | merge(list1, tail) ]

  def sort([]), do: []
  def sort([e]), do: [e]
  def sort(list) do
    {a,b} = Enum.split(list, div(length(list), 2))
    merge(sort(a), sort(b))
  end

  def merge(a, []), do: a
  def merge([], b), do: b
  def merge([ha|ta], [hb|tb]) do
    cond do
      ha < hb -> [ha | merge(ta, [hb|tb])]
      true -> [hb | merge([ha|ta], tb)]
    end
  end
end
