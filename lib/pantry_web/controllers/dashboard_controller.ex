defmodule PantryWeb.DashboardController do
  use PantryWeb, :controller
  # plug(PantryWeb.CheckAuth)

  alias Pantry.Accounts
  alias Pantry.Accounts.Client

  def show(conn, _) do
    render(conn, "show.html")
  end
end
