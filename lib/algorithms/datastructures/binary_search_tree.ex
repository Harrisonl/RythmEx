defmodule Algorithms.DataStructures.BST do

  @doc """
  Creates a new Binary tree, or tree node.

  The tree uses linked list with each node having three linked lists internally.

  * One represents the left child
  * One represents the node key
  * One represents the right child

  The first value passed to `BST.new/1` will become the root node.

  It is also used to add a new 'leaf' or 'node' to a tree.

  ```elixir
  iex> BST.new(5) 
  [ nil, 5, nil ]
  ```
  """
  def new(value), do: [nil, value, nil]

  @doc """
  Inserts a new element into a the given Binary Search Tree.

  Works it's way down the tree in a binary search fashion:
  * If a nodes key is larger then the passed in value, it will search it's left child's node
  * If a nodes key is smaller then the passed in value, it will search it's right child's node
  * If it reaches an empty or nil node, it inserts the key in a new node

  ```elixir
  iex> tree = BST.new(10)         
  [nil, 10, nil]

  iex> tree = BST.insert(tree, 5) 
  [[nil, 5, nil], 10, nil]
 
  iex> tree = BST.insert(tree, 15) 
  [[nil, 5, nil], 10, [nil, 15, nil]]
  ```
  """
  def insert(tree, value)
  def insert(nil, value), do: new(value)
  def insert([left, key, right], key), do: [left, key, right]
  def insert([left, key, right], value) when key > value, do: [insert(left, value), key, right]
  def insert([left, key, right], value), do: [left, key, insert(right, value)] 


  @doc """
  Finds a key if it exists in the given Binary Search Tree.

  Depending on the balance of the tree, can take O(logN) to O(n^2) time. For a
  more reliable search tree, use a `RedBlackTree`.

  Takes in a key to search for. If the key exists, it will return the value.
  If it does not exist, it will return nil.

  ```elixir
  iex> tree = BST.new({12, :rabbit})
  [nil, {12, :rabbit}, nil]

  iex> tree = BST.insert({4, :dog})
  [[nil, {4, :dog}, nil], {12, :rabbit}, nil]

  iex> BST.find({4, :dog})
  {4, :dog}

  iex> BST.find({4, :cat})
  nil
  ```
  """
  def find(nil, _val), do: nil
  def find([_left, val, _right], val), do: val
  def find([left, key, _right], val) when key > val, do: find(left, val)
  def find([_left, key, right], val), do: find(right, val)

  @doc """
  Coming Soon
  """
  def nodes([nil,  _key, nil],   acc), do: acc
  def nodes([nil,  _key, right], acc), do: acc + nodes(right,acc)
  def nodes([left, _key, nil],   acc), do: acc + nodes(left, acc)
  def nodes([left, _key, right], acc), do: acc + nodes(left, acc) + nodes(right, acc)
end
