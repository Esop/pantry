defmodule PantryWeb.PageControllerTest do
  use PantryWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Community Cares!"
  end
end
