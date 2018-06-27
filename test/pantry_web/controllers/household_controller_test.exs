defmodule PantryWeb.HouseholdControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Residence

  @create_attrs %{city: "some city", county: "some county", state: "some state", street_address: "some street_address", total_members: 42, zip_code: "some zip_code"}
  @update_attrs %{city: "some updated city", county: "some updated county", state: "some updated state", street_address: "some updated street_address", total_members: 43, zip_code: "some updated zip_code"}
  @invalid_attrs %{city: nil, county: nil, state: nil, street_address: nil, total_members: nil, zip_code: nil}

  def fixture(:household) do
    {:ok, household} = Residence.create_household(@create_attrs)
    household
  end

  describe "index" do
    test "lists all residences", %{conn: conn} do
      conn = get conn, household_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Residences"
    end
  end

  describe "new household" do
    test "renders form", %{conn: conn} do
      conn = get conn, household_path(conn, :new)
      assert html_response(conn, 200) =~ "New Household"
    end
  end

  describe "create household" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, household_path(conn, :create), household: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == household_path(conn, :show, id)

      conn = get conn, household_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Household"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, household_path(conn, :create), household: @invalid_attrs
      assert html_response(conn, 200) =~ "New Household"
    end
  end

  describe "edit household" do
    setup [:create_household]

    test "renders form for editing chosen household", %{conn: conn, household: household} do
      conn = get conn, household_path(conn, :edit, household)
      assert html_response(conn, 200) =~ "Edit Household"
    end
  end

  describe "update household" do
    setup [:create_household]

    test "redirects when data is valid", %{conn: conn, household: household} do
      conn = put conn, household_path(conn, :update, household), household: @update_attrs
      assert redirected_to(conn) == household_path(conn, :show, household)

      conn = get conn, household_path(conn, :show, household)
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, household: household} do
      conn = put conn, household_path(conn, :update, household), household: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Household"
    end
  end

  describe "delete household" do
    setup [:create_household]

    test "deletes chosen household", %{conn: conn, household: household} do
      conn = delete conn, household_path(conn, :delete, household)
      assert redirected_to(conn) == household_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, household_path(conn, :show, household)
      end
    end
  end

  defp create_household(_) do
    household = fixture(:household)
    {:ok, household: household}
  end
end
