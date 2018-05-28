defmodule Gencounter.Consumer do
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_does_not_matter )
  end

  def init(state) do
    {:consumer, state , subscribe_to: [Gencounter.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event, state})
    end
    Process.sleep(5000)
    # As consumer we never emit events
    {:noreply, [], state}
  end
end
