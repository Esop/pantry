defmodule PantryWeb.SessionControllerTest do
  use Pantry.FeatureCase, async: true
  import Wallaby.Query
  import Wallaby.Browser

  test "volunteers can log in", %{session: session} do
    session
    |> visit("/login")
    |> find(css(".login-form"))
    |> fill_in(Query.text_field("session_email"), with: "rbakerjax@gmail.com")
    |> fill_in(Query.text_field("session_password"), with: "mydogs33")
    |> take_screenshot()
  end
end
