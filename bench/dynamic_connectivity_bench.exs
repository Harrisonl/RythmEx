defmodule DynamicConnectivityBench do
  use Benchfella

  @list Enum.to_list(1..1_000_000)
  
  defp list do
    Algorithms.DynamicConnectivity.QuickUnion.join_multiple(@list, [ [100, 20324], [12125, 100], [54325, 100], [32, 54325], [8, 9], [900000, 8], [8, 100] ])
  end

  bench "Single Process", [list: list] do
    Algorithms.DynamicConnectivity.QuickUnion.connected?(list, 900_000, 100)
  end

end

