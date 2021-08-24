defmodule Queue do
  use GenServer

  @impl true
  def init(queue) do
    {:ok, queue}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, tail, head}
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, [element | state]}
  end
end
