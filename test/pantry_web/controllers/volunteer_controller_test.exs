defmodule PantryWeb.VolunteerControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Accounts

  @create_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", password_hash: "some password_hash"}
  @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password_hash: "some updated password_hash"}
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password_hash: nil}

  def fixture(:volunteer) do
    {:ok, volunteer} = Accounts.create_volunteer(@create_attrs)
    volunteer
  end

  describe "index" do
    test "lists all volunteers", %{conn: conn} do
      conn = get conn, volunteer_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Volunteers"
    end
  end

  describe "new volunteer" do
    test "renders form", %{conn: conn} do
      conn = get conn, volunteer_path(conn, :new)
      assert html_response(conn, 200) =~ "New Volunteer"
    end
  end

  describe "create volunteer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, volunteer_path(conn, :create), volunteer: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == volunteer_path(conn, :show, id)

      conn = get conn, volunteer_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Volunteer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, volunteer_path(conn, :create), volunteer: @invalid_attrs
      assert html_response(conn, 200) =~ "New Volunteer"
    end
  end

  describe "edit volunteer" do
    setup [:create_volunteer]

    test "renders form for editing chosen volunteer", %{conn: conn, volunteer: volunteer} do
      conn = get conn, volunteer_path(conn, :edit, volunteer)
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "update volunteer" do
    setup [:create_volunteer]

    test "redirects when data is valid", %{conn: conn, volunteer: volunteer} do
      conn = put conn, volunteer_path(conn, :update, volunteer), volunteer: @update_attrs
      assert redirected_to(conn) == volunteer_path(conn, :show, volunteer)

      conn = get conn, volunteer_path(conn, :show, volunteer)
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, volunteer: volunteer} do
      conn = put conn, volunteer_path(conn, :update, volunteer), volunteer: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "delete volunteer" do
    setup [:create_volunteer]

    test "deletes chosen volunteer", %{conn: conn, volunteer: volunteer} do
      conn = delete conn, volunteer_path(conn, :delete, volunteer)
      assert redirected_to(conn) == volunteer_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, volunteer_path(conn, :show, volunteer)
      end
    end
  end

  defp create_volunteer(_) do
    volunteer = fixture(:volunteer)
    {:ok, volunteer: volunteer}
  end
end
