defmodule SupervisorDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias SupervisorDemo.EventSupervisor

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      EventSupervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SupervisorDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
