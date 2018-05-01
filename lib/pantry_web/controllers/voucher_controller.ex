defmodule PantryWeb.VoucherController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.Voucher

  def index(conn, _params) do
    vouchers = Forms.list_vouchers()
    render(conn, "index.html", vouchers: vouchers)
  end

  def new(conn, _params) do
    changeset = Forms.change_voucher(%Voucher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"voucher" => voucher_params}) do
    case Forms.create_voucher(voucher_params) do
      {:ok, voucher} ->
        conn
        |> put_flash(:info, "Voucher created successfully.")
        |> redirect(to: voucher_path(conn, :show, voucher))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    voucher = Forms.get_voucher!(id)
    render(conn, "show.html", voucher: voucher)
  end

  def edit(conn, %{"id" => id}) do
    voucher = Forms.get_voucher!(id)
    changeset = Forms.change_voucher(voucher)
    render(conn, "edit.html", voucher: voucher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "voucher" => voucher_params}) do
    voucher = Forms.get_voucher!(id)

    case Forms.update_voucher(voucher, voucher_params) do
      {:ok, voucher} ->
        conn
        |> put_flash(:info, "Voucher updated successfully.")
        |> redirect(to: voucher_path(conn, :show, voucher))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", voucher: voucher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    voucher = Forms.get_voucher!(id)
    {:ok, _voucher} = Forms.delete_voucher(voucher)

    conn
    |> put_flash(:info, "Voucher deleted successfully.")
    |> redirect(to: voucher_path(conn, :index))
  end
end
