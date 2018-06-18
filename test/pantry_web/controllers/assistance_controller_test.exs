defmodule PantryWeb.AssistanceControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Forms

  @create_attrs %{next_service: ~D[2010-04-17], received_food: true, received_voucher: true}
  @update_attrs %{next_service: ~D[2011-05-18], received_food: false, received_voucher: false}
  @invalid_attrs %{next_service: nil, received_food: nil, received_voucher: nil}

  def fixture(:assistance) do
    {:ok, assistance} = Forms.create_assistance(@create_attrs)
    assistance
  end

  describe "index" do
    test "lists all assistance", %{conn: conn} do
      conn = get conn, assistance_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Assistance"
    end
  end

  describe "new assistance" do
    test "renders form", %{conn: conn} do
      conn = get conn, assistance_path(conn, :new)
      assert html_response(conn, 200) =~ "New Assistance"
    end
  end

  describe "create assistance" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, assistance_path(conn, :create), assistance: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == assistance_path(conn, :show, id)

      conn = get conn, assistance_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Assistance"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, assistance_path(conn, :create), assistance: @invalid_attrs
      assert html_response(conn, 200) =~ "New Assistance"
    end
  end

  describe "edit assistance" do
    setup [:create_assistance]

    test "renders form for editing chosen assistance", %{conn: conn, assistance: assistance} do
      conn = get conn, assistance_path(conn, :edit, assistance)
      assert html_response(conn, 200) =~ "Edit Assistance"
    end
  end

  describe "update assistance" do
    setup [:create_assistance]

    test "redirects when data is valid", %{conn: conn, assistance: assistance} do
      conn = put conn, assistance_path(conn, :update, assistance), assistance: @update_attrs
      assert redirected_to(conn) == assistance_path(conn, :show, assistance)

      conn = get conn, assistance_path(conn, :show, assistance)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, assistance: assistance} do
      conn = put conn, assistance_path(conn, :update, assistance), assistance: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Assistance"
    end
  end

  describe "delete assistance" do
    setup [:create_assistance]

    test "deletes chosen assistance", %{conn: conn, assistance: assistance} do
      conn = delete conn, assistance_path(conn, :delete, assistance)
      assert redirected_to(conn) == assistance_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, assistance_path(conn, :show, assistance)
      end
    end
  end

  defp create_assistance(_) do
    assistance = fixture(:assistance)
    {:ok, assistance: assistance}
  end
end
