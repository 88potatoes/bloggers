# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bloggers.Repo.insert!(%Bloggers.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Bloggers.Repo
alias Bloggers.Blog.Blogpost

Repo.insert %Blogpost{
  title: "New One",
  body: "newone"
}

Repo.insert %Blogpost{
  title: "Philosophy",
  body: "Kinda my philosophy"
}

Repo.insert %Blogpost{
  title: "HEHE",
  body: "hawahaw"
}
