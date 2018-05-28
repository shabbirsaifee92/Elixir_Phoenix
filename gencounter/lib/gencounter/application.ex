defmodule Gencounter.Application do
  import Supervisor.Spec, warn: false
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Gencounter.Worker.start_link(arg)
      # {Gencounter.Worker, arg},
      worker(Gencounter.Producer, [0]),
      worker(Gencounter.ProducerConsumer, []),
      worker(Gencounter.Consumer, [], id: 1),
      worker(Gencounter.Consumer, [], id: 2)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gencounter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
