defmodule PantryWeb.ProduceDistributionControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Forms

  @create_attrs %{first_name: "some first_name", food_stamps: true, income_eligibility: true, last_name: "some last_name", public_housing: "some public_housing", signature: "some signature", ssi_medicaid: "some ssi_medicaid", temporary_assistance: "some temporary_assistance"}
  @update_attrs %{first_name: "some updated first_name", food_stamps: false, income_eligibility: false, last_name: "some updated last_name", public_housing: "some updated public_housing", signature: "some updated signature", ssi_medicaid: "some updated ssi_medicaid", temporary_assistance: "some updated temporary_assistance"}
  @invalid_attrs %{first_name: nil, food_stamps: nil, income_eligibility: nil, last_name: nil, public_housing: nil, signature: nil, ssi_medicaid: nil, temporary_assistance: nil}

  def fixture(:produce_distribution) do
    {:ok, produce_distribution} = Forms.create_produce_distribution(@create_attrs)
    produce_distribution
  end

  describe "index" do
    test "lists all produce_distributions", %{conn: conn} do
      conn = get conn, produce_distribution_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Produce distributions"
    end
  end

  describe "new produce_distribution" do
    test "renders form", %{conn: conn} do
      conn = get conn, produce_distribution_path(conn, :new)
      assert html_response(conn, 200) =~ "New Produce distribution"
    end
  end

  describe "create produce_distribution" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, produce_distribution_path(conn, :create), produce_distribution: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == produce_distribution_path(conn, :show, id)

      conn = get conn, produce_distribution_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Produce distribution"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, produce_distribution_path(conn, :create), produce_distribution: @invalid_attrs
      assert html_response(conn, 200) =~ "New Produce distribution"
    end
  end

  describe "edit produce_distribution" do
    setup [:create_produce_distribution]

    test "renders form for editing chosen produce_distribution", %{conn: conn, produce_distribution: produce_distribution} do
      conn = get conn, produce_distribution_path(conn, :edit, produce_distribution)
      assert html_response(conn, 200) =~ "Edit Produce distribution"
    end
  end

  describe "update produce_distribution" do
    setup [:create_produce_distribution]

    test "redirects when data is valid", %{conn: conn, produce_distribution: produce_distribution} do
      conn = put conn, produce_distribution_path(conn, :update, produce_distribution), produce_distribution: @update_attrs
      assert redirected_to(conn) == produce_distribution_path(conn, :show, produce_distribution)

      conn = get conn, produce_distribution_path(conn, :show, produce_distribution)
      assert html_response(conn, 200) =~ "some updated first_name"
    end

    test "renders errors when data is invalid", %{conn: conn, produce_distribution: produce_distribution} do
      conn = put conn, produce_distribution_path(conn, :update, produce_distribution), produce_distribution: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Produce distribution"
    end
  end

  describe "delete produce_distribution" do
    setup [:create_produce_distribution]

    test "deletes chosen produce_distribution", %{conn: conn, produce_distribution: produce_distribution} do
      conn = delete conn, produce_distribution_path(conn, :delete, produce_distribution)
      assert redirected_to(conn) == produce_distribution_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, produce_distribution_path(conn, :show, produce_distribution)
      end
    end
  end

  defp create_produce_distribution(_) do
    produce_distribution = fixture(:produce_distribution)
    {:ok, produce_distribution: produce_distribution}
  end
end
