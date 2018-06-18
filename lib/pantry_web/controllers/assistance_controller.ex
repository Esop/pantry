defmodule PantryWeb.AssistanceController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.Assistance

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
    assistance = Forms.list_assistance(client)
    render(conn, "index.html", assistance: assistance, client: client)
  end

  def new(conn, _params, client) do
    changeset =
      %Assistance{client_id: client.id}
      |> Forms.change_assistance()

    render(conn, "new.html", changeset: changeset, client: client)
  end

  def create(conn, %{"assistance" => assistance_params}, client) do
    assistance_params =
      assistance_params
      |> Map.put("client_id", client.id)

    case Forms.create_assistance(assistance_params) do
      {:ok, assistance} ->
        conn
        |> put_flash(:info, "Assistance created successfully.")
        |> redirect(to: client_assistance_path(conn, :show, client, assistance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, client) do
    assistance = Forms.get_assistance!(client, id)
    render(conn, "show.html", assistance: assistance, client: client)
  end

  def edit(conn, %{"id" => id}, client) do
    assistance = Forms.get_assistance!(client, id)
    changeset = Forms.change_assistance(assistance)
    render(conn, "edit.html", assistance: assistance, changeset: changeset, client: client)
  end

  def update(conn, %{"id" => id, "assistance" => assistance_params}, client) do
    assistance = Forms.get_assistance!(client, id)

    case Forms.update_assistance(assistance, assistance_params) do
      {:ok, assistance} ->
        conn
        |> put_flash(:info, "Assistance updated successfully.")
        |> redirect(to: client_assistance_path(conn, :show, client, assistance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assistance: assistance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, client) do
    assistance = Forms.get_assistance!(client, id)
    {:ok, _assistance} = Forms.delete_assistance(assistance)

    conn
    |> put_flash(:info, "Assistance deleted successfully.")
    |> redirect(to: client_assistance_path(conn, :index, client))
  end
end
