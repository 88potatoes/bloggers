defmodule Bloggers.Repo.CreateBlogposts do
  use Ecto.Migration

  def change do
    create table(:blogposts) do
      add :title, :string
      add :body, :string

      timestamps()

    end
    create unique_index(:blogposts, [:title])
  end
end
