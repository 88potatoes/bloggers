defmodule Bloggers.Repo do
  use Ecto.Repo,
    otp_app: :bloggers,
    adapter: Ecto.Adapters.Postgres
end
