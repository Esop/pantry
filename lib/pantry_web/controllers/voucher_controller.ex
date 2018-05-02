defmodule PantryWeb.VoucherController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.Voucher

  @doc """
  I needed to override this function
  in order to get nested routing working.
  I was told that I could get the same functionality
  by implementing a Plug.
  """
  def action(conn, _) do
    client = Pantry.Accounts.get_client!(conn.params["client_id"])
    args = [conn, conn.params, client]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params, client) do
    vouchers = Forms.list_vouchers(client)
    render(conn, "index.html", vouchers: vouchers, client: client)
  end

  def new(conn, _params, client) do
    changeset =
      %Pantry.Forms.Voucher{client_id: client.id}
      |> Forms.change_voucher()

    render(conn, "new.html", changeset: changeset, client: client)
  end

  def create(conn, %{"voucher" => voucher_params}, client) do
    voucher_params =
      voucher_params
      |> Map.put("client_id", client.id)

    case Forms.create_voucher(voucher_params) do
      {:ok, voucher} ->
        conn
        |> put_flash(:info, "Voucher created successfully.")
        |> redirect(to: client_voucher_path(conn, :show, client, voucher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, client) do
    voucher = Forms.get_voucher!(client, id)
    render(conn, "show.html", voucher: voucher, client: client)
  end

  def edit(conn, %{"id" => id}, client) do
    voucher = Forms.get_voucher!(client, id)
    changeset = Forms.change_voucher(voucher)
    render(conn, "edit.html", voucher: voucher, changeset: changeset, client: client)
  end

  def update(conn, %{"id" => id, "voucher" => voucher_params}, client) do
    voucher = Forms.get_voucher!(client, id)

    case Forms.update_voucher(voucher, voucher_params) do
      {:ok, voucher} ->
        conn
        |> put_flash(:info, "Voucher updated successfully.")
        |> redirect(to: client_voucher_path(conn, :show, client, voucher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", voucher: voucher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, client) do
    voucher = Forms.get_voucher!(client, id)
    {:ok, _voucher} = Forms.delete_voucher(voucher)

    conn
    |> put_flash(:info, "Voucher deleted successfully.")
    |> redirect(to: client_voucher_path(conn, :index, client))
  end
end
