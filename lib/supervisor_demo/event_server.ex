defmodule SupervisorDemo.EventServer do
  use GenServer

  def start_link(interval) do
    GenServer.start_link(__MODULE__, interval, name: __MODULE__)
  end

  def init(interval) do
    send(__MODULE__, :tick)
    {:ok, %{interval: interval}}
  end

  def handle_info(:tick, %{interval: interval} = state) do
    tick()
    schedule_tick(interval)
    {:noreply, state}
  end

  defp tick() do
    # Work here
    IO.puts("Tick tock, see you soon!")
  end

  defp schedule_tick(interval) do
    Process.send_after(__MODULE__, :tick, interval)
  end
end
