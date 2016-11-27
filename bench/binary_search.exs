defmodule BasicBench do
  use Benchfella

  @list Enum.to_list(1..10_000_000)

  bench "Single Process" do
    Algorithms.BinarySearch.find(@list, 999_999)
  end

  bench "Multiple Process" do
    @list
    |> Enum.chunk(250_000)
    |> Enum.each(&(spawn(Algorithms.BinarySearch.find(&1, 999_999))))
  end
end
