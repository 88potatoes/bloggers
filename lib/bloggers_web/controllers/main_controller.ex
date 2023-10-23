defmodule BloggersWeb.MainController do
  use BloggersWeb, :controller

  def main(conn, _params) do
    render(conn, :main)
  end
end
