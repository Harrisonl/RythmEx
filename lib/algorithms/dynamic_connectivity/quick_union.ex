defmodule Algorithms.DynamicConnectivity.QuickUnion do

  @moduledoc """
  Creates a Tree of connected nodes. This makes the joining of two nodes simple as you only update 
  one node.

  * Example

  1    2    5    6    9
      /     |
     7      3
    / \
   4   8

  If we wanted to join 6 to 8 we would update the ID of 6 to be 8.

  When checking if they are connected, we work our way up the tree getting the root of each element.

  E.g.

  `QuickUnion.connect?(ids_list, 3, 8)`
  `false`

  The finding of the root would go (root(8) -> 7, root(7) -> 2, root(2) -> 2) == (root(3) -> 5, root(5) -> 5)

  It is also weighted to avoid the adding of a larger tree to a smaller tree (e.g. pointing 2 to 5) to reduce look up
  times.
  """

  def connected?(list, node_a, node_b) do
    list
    |> find_roots({node_a, 1}, {node_b, 1})
    |> nodes_connected?
  end

  def join(list, node_a, node_b) do
    list
    |> find_roots({node_a, 1}, {node_b, 1})
    |> update_root(list)
  end
  
  def join_multiple(list, pairs) do 
    pairs 
    |> Enum.reduce(list, fn([a,b], acc) 
      -> join(acc, a, b) 
    end)
  end


  # --------- PRIVATE

  defp update_root([{a, acc_a}, {b, acc_b}], list) when acc_a < acc_b or acc_a == acc_b do
    list
    |> List.replace_at(a, b)
  end

  defp update_root([{a, acc_a}, {b, acc_b}], list) when acc_a > acc_b do
    list
    |> List.replace_at(b, a)
  end

  defp find_roots(list, {a, acc_a}, {b, acc_b}) do
    [id_a, id_b] = 
      [a,b]
      |> Enum.map(&(Enum.fetch!(list, &1)))

    cond do
      [a,b] == [id_a, id_b] ->
        [{a, acc_a}, {b, acc_b}]
      a == id_a ->
        find_roots(list, {a, acc_a}, {id_b, acc_b + 1})
      b == id_b ->
        find_roots(list, {id_a, acc_a + 1}, {b, acc_b})
      true ->
        find_roots(list, {id_a, acc_a + 1}, {id_b, acc_b + 1})
    end
  end

  defp nodes_connected?([{a, _acc_a}, {a, _acc_b}]), do: true
  defp nodes_connected?([{a, _acc_a}, {b, _acc_b}]), do: false
end
