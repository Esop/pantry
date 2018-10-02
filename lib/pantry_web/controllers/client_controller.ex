defmodule PantryWeb.ClientController do
  use PantryWeb, :controller
  plug(PantryWeb.CheckAuth)

  alias Pantry.Accounts
  alias Pantry.Accounts.Client

  @sort_params ~w(first_name last_name inserted_at)

  def index(conn, params) do
    search = Pantry.Utils.parse_search(params["query"])
    sort = sort(params["sort"])

    sorted_clients = fetch_clients(sort, search)


    render(
      conn,
      "index.html",
      sorted_clients: sorted_clients,
      sort: sort
    )
  end

  def new(conn, _params) do
    changeset = Accounts.change_client(%Client{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"client" => client_params}) do
    case Accounts.create_client(client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client created successfully.")
        |> redirect(to: client_path(conn, :show, client))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    render(conn, "show.html", client: client)
  end

  def edit(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    changeset = Accounts.change_client(client)
    render(conn, "edit.html", client: client, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Accounts.get_client!(id)

    case Accounts.update_client(client, client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client updated successfully.")
        |> redirect(to: client_path(conn, :show, client))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", client: client, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    {:ok, _client} = Accounts.delete_client(client)

    conn
    |> put_flash(:info, "Client deleted successfully.")
    |> redirect(to: client_path(conn, :index))
  end

  defp sort(nil), do: sort("inserted_at")
  defp sort(param), do: Pantry.Utils.safe_to_atom(param, @sort_params)


  defp fetch_clients(sort, search) do
    Pantry.Accounts.Client.sort_clients(sort, search)
  end
end
