defmodule PantryWeb.SessionController do
  use PantryWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case PantryWeb.Auth.login_by_email_and_pass(conn, email, pass) do
      {:ok, conn} ->
        conn
        |> put_flash(
          :info,
          "Welcome back #{conn.assigns.current_user.first_name}, you are logged in!"
        )
        |> redirect(to: client_path(conn, :index))

      {:error, _reason, conn} ->
        conn
        |> put_flash(:danger, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> put_flash(:info, "You have been logged out!")
    |> redirect(to: page_path(conn, :index))
  end
end
