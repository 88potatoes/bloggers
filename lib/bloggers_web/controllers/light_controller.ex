defmodule BloggersWeb.LightController do
  use BloggersWeb, :controller

  def light(conn, _params) do
    render(conn, :light)
  end
end
