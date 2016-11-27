defmodule Algorithms.DynamicConnectivity.QuickFind do

  def connect?(ids_list, node_a, node_b) do
    ids_list
    |> find_ids(node_a, node_b)
    |> nodes_connected?
  end

  def join(ids_list, node_a, node_b) do
    ids = 
      ids_list
      |> find_ids(node_a, node_b)

    connect(ids_list, ids)
  end

  # ----- PRIVATE

  defp find_ids(list, a, b) do
    [a, b]
    |> Enum.map(&(Enum.fetch!(list, &1)))
  end

  defp nodes_connected?([a, a]), do: true
  defp nodes_connected?([a, b]), do: false

  defp connect(x, y, acc \\ [])
  defp connect([], _ids, acc), do: acc |> Enum.reverse
  defp connect([ a | tail], [a, b] = ids, acc), do: connect(tail, ids, [b | acc])
  defp connect([ head | tail], [_x, _y] = ids, acc), do: connect(tail, ids, [head | acc])

end
