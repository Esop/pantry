defmodule PantryWeb.CertificationControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Forms

  @create_attrs %{address: "some address", county: "some county", family_size: 42, first_name: "some first_name", income_eligibility: true, last_name: "some last_name", medicaid: true, supplemental_nutrition_assistance: true, supplemental_security_income: true, temporary_assistance_to_needy_families: true}
  @update_attrs %{address: "some updated address", county: "some updated county", family_size: 43, first_name: "some updated first_name", income_eligibility: false, last_name: "some updated last_name", medicaid: false, supplemental_nutrition_assistance: false, supplemental_security_income: false, temporary_assistance_to_needy_families: false}
  @invalid_attrs %{address: nil, county: nil, family_size: nil, first_name: nil, income_eligibility: nil, last_name: nil, medicaid: nil, supplemental_nutrition_assistance: nil, supplemental_security_income: nil, temporary_assistance_to_needy_families: nil}

  def fixture(:certification) do
    {:ok, certification} = Forms.create_certification(@create_attrs)
    certification
  end

  describe "index" do
    test "lists all certifications", %{conn: conn} do
      conn = get conn, certification_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Certifications"
    end
  end

  describe "new certification" do
    test "renders form", %{conn: conn} do
      conn = get conn, certification_path(conn, :new)
      assert html_response(conn, 200) =~ "New Certification"
    end
  end

  describe "create certification" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, certification_path(conn, :create), certification: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == certification_path(conn, :show, id)

      conn = get conn, certification_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Certification"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, certification_path(conn, :create), certification: @invalid_attrs
      assert html_response(conn, 200) =~ "New Certification"
    end
  end

  describe "edit certification" do
    setup [:create_certification]

    test "renders form for editing chosen certification", %{conn: conn, certification: certification} do
      conn = get conn, certification_path(conn, :edit, certification)
      assert html_response(conn, 200) =~ "Edit Certification"
    end
  end

  describe "update certification" do
    setup [:create_certification]

    test "redirects when data is valid", %{conn: conn, certification: certification} do
      conn = put conn, certification_path(conn, :update, certification), certification: @update_attrs
      assert redirected_to(conn) == certification_path(conn, :show, certification)

      conn = get conn, certification_path(conn, :show, certification)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, certification: certification} do
      conn = put conn, certification_path(conn, :update, certification), certification: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Certification"
    end
  end

  describe "delete certification" do
    setup [:create_certification]

    test "deletes chosen certification", %{conn: conn, certification: certification} do
      conn = delete conn, certification_path(conn, :delete, certification)
      assert redirected_to(conn) == certification_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, certification_path(conn, :show, certification)
      end
    end
  end

  defp create_certification(_) do
    certification = fixture(:certification)
    {:ok, certification: certification}
  end
end
