defmodule PantryWeb.PasswordResetController do
  use PantryWeb, :controller

  alias Pantry.Accounts.Volunteer
  alias Pantry.Accounts

  plug(:redirect_if_signed_in when action in [:new, :create])
  plug(:fetch_password_reset when action in [:show, :update])

  @doc """
  renders an email field.
  lib/level_web/templates/password_reset/new.html.eex
  """
  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"password_reset_email" => %{"email" => email}}) do
    case Accounts.get_vol_by_email(email) do
      {:ok, volunteer} ->
        {:ok, _} = Volunteer.initiate_password_reset(volunteer)

        conn
        |> redirect(to: password_reset_path(conn, :initiated))

      _ ->
        # If the user doesn't exist, we don't want to expose that knowledge
        # to the user, so we'll just pretend we did find the user.
        conn
        |> redirect(to: password_reset_path(conn, :initiated))
    end
  end

  def initiated(conn, _) do
    render(conn, "initiated.html")
  end

  def show(conn, _) do
    vol = conn.assigns.password_reset.user
    # conn
    # |> assign(:changeset, Volunteer.reset_password_changeset(vol, %{}))
    # |> render("show.html")
  end

  def update(conn, %{"password_reset" => params}) do
    reset = conn.assigns.password_reset

    case Volunteer.reset_password(reset, params["password"]) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "You password was successfully reset!")
        |> redirect(to: session_path(conn, :new))

      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render("show.html")
    end
  end

  defp fetch_password_reset(conn, _opts) do
    case Volunteer.get_password_reset(conn.params["id"]) do
      {:ok, reset} ->
        conn
        |> assign(:password_reset, reset)

      _ ->
        conn
        |> put_status(404)
        |> put_view(ErrorView)
        |> render("404.html")
        |> halt()
    end
  end

  defp redirect_if_signed_in(conn, _opts) do
    if conn.assigns.current_user do
      conn
      |> redirect(to: page_path(conn, :index, ["spaces"]))
      |> halt()
    else
      conn
    end
  end
end
