defmodule BloggersWeb.PuzzleLive do
  use BloggersWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="grid-rows-5 grid-cols-5 w-[500px]">
        <div class="text-center">A</div>
        <div class="text-center">A</div>
        <div class="text-center">A</div>

      </div>
    """
  end

  # def handle_event(event, params, socket) do

  # end
end
