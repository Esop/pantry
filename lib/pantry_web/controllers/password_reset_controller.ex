defmodule PantryWeb.PasswordResetController do
  use PantryWeb, :controller

  alias Pantry.Accounts
  alias Pantry.Accounts.PasswordReset

  def show(conn, %{"id" => id}) do
    password_reset = Accounts.get_password_reset!(id)
    render(conn, "show.html", password_reset: password_reset)
  end

  def create(conn, %{"password_reset" => password_reset_params}) do
    case Accounts.create_password_reset(password_reset_params) do
      {:ok, password_reset} ->
        conn
        |> put_flash(:info, "Password reset created successfully.")
        |> redirect(to: password_reset_path(conn, :show, password_reset))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
