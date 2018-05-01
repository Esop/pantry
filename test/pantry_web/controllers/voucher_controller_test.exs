defmodule PantryWeb.VoucherControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Forms

  @create_attrs %{next_service_date: ~D[2010-04-17], received_food: true, received_money: true, voucher_amount: "some voucher_amount"}
  @update_attrs %{next_service_date: ~D[2011-05-18], received_food: false, received_money: false, voucher_amount: "some updated voucher_amount"}
  @invalid_attrs %{next_service_date: nil, received_food: nil, received_money: nil, voucher_amount: nil}

  def fixture(:voucher) do
    {:ok, voucher} = Forms.create_voucher(@create_attrs)
    voucher
  end

  describe "index" do
    test "lists all vouchers", %{conn: conn} do
      conn = get conn, voucher_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Vouchers"
    end
  end

  describe "new voucher" do
    test "renders form", %{conn: conn} do
      conn = get conn, voucher_path(conn, :new)
      assert html_response(conn, 200) =~ "New Voucher"
    end
  end

  describe "create voucher" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, voucher_path(conn, :create), voucher: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == voucher_path(conn, :show, id)

      conn = get conn, voucher_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Voucher"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, voucher_path(conn, :create), voucher: @invalid_attrs
      assert html_response(conn, 200) =~ "New Voucher"
    end
  end

  describe "edit voucher" do
    setup [:create_voucher]

    test "renders form for editing chosen voucher", %{conn: conn, voucher: voucher} do
      conn = get conn, voucher_path(conn, :edit, voucher)
      assert html_response(conn, 200) =~ "Edit Voucher"
    end
  end

  describe "update voucher" do
    setup [:create_voucher]

    test "redirects when data is valid", %{conn: conn, voucher: voucher} do
      conn = put conn, voucher_path(conn, :update, voucher), voucher: @update_attrs
      assert redirected_to(conn) == voucher_path(conn, :show, voucher)

      conn = get conn, voucher_path(conn, :show, voucher)
      assert html_response(conn, 200) =~ "some updated voucher_amount"
    end

    test "renders errors when data is invalid", %{conn: conn, voucher: voucher} do
      conn = put conn, voucher_path(conn, :update, voucher), voucher: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Voucher"
    end
  end

  describe "delete voucher" do
    setup [:create_voucher]

    test "deletes chosen voucher", %{conn: conn, voucher: voucher} do
      conn = delete conn, voucher_path(conn, :delete, voucher)
      assert redirected_to(conn) == voucher_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, voucher_path(conn, :show, voucher)
      end
    end
  end

  defp create_voucher(_) do
    voucher = fixture(:voucher)
    {:ok, voucher: voucher}
  end
end