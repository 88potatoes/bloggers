defmodule BloggersWeb.Router do
  use BloggersWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BloggersWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  def print_conn(conn, _params) do
    IO.inspect conn
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BloggersWeb do
    pipe_through :browser

    get "/blogposts", PageController, :blogposts
    get "/", PageController, :home
    get "/main", MainController, :main
    get "/light", LightController, :light
    live "/light_live", LightLive, :live
    get "/new_one", PageController, :new_one
    get "/insert_blogpost", PageController, :insert_blogpost
    post "/insert_blogpost", PageController, :insert_blog
    live "/numberlink", PuzzleLive, :numberlink
  end

  # Other scopes may use custom stacks.
  # scope "/api", BloggersWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:bloggers, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: BloggersWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
