defmodule PantryWeb.Dashboard.ProfileController do
  use PantryWeb, :controller
  alias Pantry.Accounts

  def index(conn, params) do
    client = Accounts.get_client!("1")
    render(conn, "index.html", client: client)
  end
end
