defmodule PantryWeb.DashboardController do
  use PantryWeb, :controller
  # plug(PantryWeb.CheckAuth)

  alias Pantry.Accounts

  def show(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    render(conn, "show.html", client: client)
  end
end
