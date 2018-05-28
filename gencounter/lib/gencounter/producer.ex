defmodule Gencounter.Producer do
  use GenStage

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(counter), do: {:producer, counter}

  def handle_demand(demand, counter) do
    events = Enum.to_list(counter..(counter + demand - 1));
    {:noreply, events, (counter + demand)}
  end
end
