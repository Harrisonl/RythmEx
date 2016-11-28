defmodule Timer do

  def time(func) do
    {time, x} = :timer.tc(func)

    IO.puts ["Completed in ", "#{time / 1_000_000}", " seconds"]
  end
end
