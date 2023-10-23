defmodule BloggersWeb.ErrorJSONTest do
  use BloggersWeb.ConnCase, async: true

  test "renders 404" do
    assert BloggersWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert BloggersWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
