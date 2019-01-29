defmodule PantryWeb.SessionControllerTest do
  use Pantry.FeatureCase, async: true
  import Wallaby.Query
  import Wallaby.Browser
  import Pantry.Factory

  test "volunteers can log in", %{session: session} do
    volunteer = insert(:volunteer)

    session
    |> visit("/login")
    |> find(css(".login-form"))
    |> fill_in(Query.text_field("session_email"), with: volunteer.email)
    |> fill_in(Query.text_field("password"), with: volunteer.password)
    |> click(button("login", text: "Log in"))

    assert current_path(session) == "/clients"
    assert has_text?(session, "All Current Clients")
  end

  test "volunteers must have an account to log in", %{session: session} do
    unregistered_volunteer = build(:volunteer)

    session
    |> visit("/login")
    |> find(css(".login-form"))
    |> fill_in(Query.text_field("session_email"), with: unregistered_volunteer.email)
    |> fill_in(Query.text_field("password"), with: unregistered_volunteer.password)
    |> click(button("login", text: "Log in"))

    assert current_path(session) == "/login"
    assert has_text?(session, "Invalid username/password combination")
  end
end
