defmodule Bloggers.Blog do
  @doc """
  Context for Blog
  """
  import Ecto.Query
  import Ecto.Changeset
  alias Bloggers.Repo
  alias Bloggers.Blog.Blogpost

  def list_blogs do
    Repo.all(Blogpost)
  end

  def get_new_one do
    a = Repo.all(from b in Blogpost, where: b.id > 3)
    IO.inspect a
    Enum.at(a, 0)
  end

  def insert_blogpost(blogpost \\ %{}) do
    %Blogpost{}
    |> cast(blogpost, [:title, :body])
    |> IO.inspect
    |> validate_required([:title, :body])
    |> Repo.insert
  end
end
