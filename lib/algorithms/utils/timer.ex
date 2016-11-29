defmodule Timer do

 def time(func) do
   {time, x} = :timer.tc(func)

   comp = cond do
     time < 10_000 -> "#{time} microseconds"
     true -> "#{time / 1_000_000} seconds"
   end

   IO.puts ["Completed in ", comp, " returned #{x}"]
  end

end
