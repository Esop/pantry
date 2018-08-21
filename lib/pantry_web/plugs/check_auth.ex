defmodule PantryWeb.CheckAuth do
  import Plug.Conn
  use PantryWeb, :controller

  def init(_args) do
  end

  def call(conn, _args) do
    current_user = conn.assigns[:current_user]
    current_user_id = get_session(conn, :user_id)

    if current_user && current_user_id == current_user.id do
      conn
    else
      conn
      |> put_flash(:danger, "You are not logged in")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
