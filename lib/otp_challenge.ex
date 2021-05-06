defmodule OtpChallenge.Queue do
  use GenServer

  def start_link(initial_stack) when is_list(initial_stack)  do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  def enqueue(pid, element)  do
    GenServer.cast(pid, {:enqueue, element})
  end


  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, [element | state]}
  end

  @impl true
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end


  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end
end
# curl -u fpolica91  -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/user/repos -d '{"name":"genservers","private":false}'
# curl \
# -u fpolica91
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/fpolica91/repos \
#   -d '{"name":"genservers"}'
