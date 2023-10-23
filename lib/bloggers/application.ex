defmodule Bloggers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BloggersWeb.Telemetry,
      # Start the Ecto repository
      Bloggers.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bloggers.PubSub},
      # Start Finch
      {Finch, name: Bloggers.Finch},
      # Start the Endpoint (http/https)
      BloggersWeb.Endpoint
      # Start a worker by calling: Bloggers.Worker.start_link(arg)
      # {Bloggers.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bloggers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BloggersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
