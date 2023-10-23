defmodule BloggersWeb.LightLive do
  use BloggersWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="relative w-[50%] bg-slate-300 h-[10%] flex flex-row items-center justify-center">
      <div class="bg-slate-600 justify-center min-h-full" style={"width: #{@brightness}%"}></div>
      <div class="absolute"><%= @brightness %></div>
    </div>
    <div>
      <.libutt event="min">
        Min
      </.libutt>
      <.libutt event="up">
        ^
      </.libutt>
      <.libutt event="down">
        v
      </.libutt>
      <.libutt event="max">
        Max
      </.libutt>
    </div>
    """
  end

  def libutt(assigns) do
    ~H"""
      <button class="border-2 border-black rounded-md p-4 min-w-[8rem]" phx-click={@event}>
        <%= render_slot(@inner_block) %>
      </button>
    """
  end

  def handle_event("min", _, socket) do
    socket = assign(socket, brightness: 0)
    {:noreply, socket}
  end
  def handle_event("max", _, socket) do
    socket = assign(socket, brightness: 100)
    {:noreply, socket}
  end
  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &(max(&1-10, 0)))
    {:noreply, socket}
  end
  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &(min(&1+10, 100)))
    {:noreply, socket}
  end


end
