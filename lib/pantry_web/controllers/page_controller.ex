defmodule PantryWeb.PageController do
  use PantryWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
