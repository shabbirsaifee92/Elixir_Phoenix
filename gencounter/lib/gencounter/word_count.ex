defmodule Gencounter.WordCount do
#
#   #Strategy1: In memory execution of the entire file
#   # Eager
#   ## Simple
#   ## Efficient for small collections
#   ## inefficient for large collections
#
#   File.read!("source")
#   |> String.split("\n")
#   |> Enum.flat_map(&String.split/1) # returns ["a", "b", "c"]
#   |> Enum.reduce(%{}, fn(word,map) -> Map.update(map, word, 1 , &(&1 +1) end)
#   # returns %{"a" => 1, "b" =>2, "c"=>1}
#
#   # Strategy2 : Lazy
#   ## load  single line at time in memory instead of the entire file at a time
#   ## Less memory usage at the cost of computation
#   ## Allows us to work with large or infinite collections
#   File.stream!("source", :line)
#   |> Stream.flat_map(&String.split/1)
#   |> Enum.reduce(%{}, fn(word,map) -> Map.update(map,word,1, &(&1 + 1)) end)
#
#   # Concurrency with flow: implented internally using genstage
#   ## We give up ordering and process locality for Concurrency
#   ## Tools for working with bounded and unbounded data
#   ## There is overhead when data flows through processes
#   ##
#   File.stream!("source, :line")
#   |> Flow.
end
