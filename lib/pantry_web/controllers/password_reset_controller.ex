defmodule PantryWeb.PasswordResetController do
  use PantryWeb, :controller

  alias Pantry.Accounts.{Volunteer, PasswordReset}

  def show(conn, _params) do
    render(conn, "show.html", title: "Reset your password")
  end

  def create(conn, %{"username" => password_reset_params}) do
    changeset = Volunteer.password_reset_init(password_reset_params)

    render(
      conn,
      "new.html",
      changeset: changeset
    )
  end
end
