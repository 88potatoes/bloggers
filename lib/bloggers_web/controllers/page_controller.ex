defmodule BloggersWeb.PageController do
  use BloggersWeb, :controller
  alias Bloggers.Blog

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def blogposts(conn, _params) do
    conn = assign(conn, :blogposts, Blog.list_blogs())
    # IO.inspect conn.assigns
    render(conn, :blogposts)
  end

  def new_one(conn, _params) do
    conn = assign(conn, :blogpost, Blog.get_new_one())
    render(conn, :single_blog)
  end

  def insert_blogpost(conn, _params) do
    conn = assign(conn, :form, %{})
    render(conn, :insert_blogpost)
  end

  def insert_blog(conn, _params) do
    render(conn, :insert_blogpost)
  end
end
