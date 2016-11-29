defmodule Algorithms.DataStructures.BST do

  def new(value), do: [[], value, []]

  def insert([left, nodev, right], nodev), do: [left, nodev, right]
  def insert([[], nodev, []], value) when nodev > value, do: [new(value), nodev, []]
  def insert([[], nodev, []], value) when nodev < value, do: [[], nodev, new(value)]

  def insert([[], nodev, right], value) when nodev > value, do: [new(value), nodev, right]
  def insert([[], nodev, right], value), do: [[], nodev, insert(right, value)]
  def insert([left, nodev, []], value) when nodev < value, do: [left, nodev, new(value)]
  def insert([left, nodev, []], value), do: [insert(left, value), nodev, []]

  def insert([left, nodev, right], value) when nodev > value do 
   [insert(left, value), nodev, right]
  end
  def insert([left, nodev, right], value) when nodev < value do 
   [left, nodev, insert(right, value)] 
  end

  def find([_left, val, _right],val), do: val
  def find([val, _node, _right],val), do: val
  def find([_left, _node, val],val), do: val
  def find([[], _val, []],val), do: nil
  def find([left, nodev, _right], val) when nodev > val, do: find(left, val)
  def find([_left, nodev, right], val), do: find(right, val)

  def depth([[], node, []],  acc), do: acc
  def depth([[], node, right],  acc), do: acc + depth(right,acc)
  def depth([left, node, []],  acc), do: acc + depth(left, acc)
  def depth([left, node, right],  acc), do: acc + depth(left, acc) + depth(right, acc)

  def test_tree do
    tree = new(5_000_000)

    tree2 = 1..1_000_000
    |> Enum.to_list
    |> Enum.shuffle
    |> Enum.reduce(tree, fn(x, acc) ->
      acc = insert(acc, x)
      acc
     end)

    IO.puts "Started Search"
    Timer.time(fn -> find(tree2, 764321) end)
  end


end
