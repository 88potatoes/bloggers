defmodule Bloggers.Blog.Blogpost do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "blogposts" do
    field :title, :string
    field :body, :string

    timestamps()
  end

end
