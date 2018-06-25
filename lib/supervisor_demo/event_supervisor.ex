defmodule SupervisorDemo.EventSupervisor do
  use Supervisor
  alias SupervisorDemo.EventServer

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      {EventServer, 5 * 1000}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
