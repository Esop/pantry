defmodule PantryWeb.HouseholdController do
  use PantryWeb, :controller

  alias Pantry.Residence
  alias Pantry.Residence.Household

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
    household = Residence.list_residences(client)
    render(conn, "index.html", household: household, client: client)
  end

  def new(conn, _params, client) do
    changeset =
      %Household{client_id: client.id}
      |> Residence.change_household()

    render(conn, "new.html", changeset: changeset, client: client)
  end

  def create(conn, %{"household" => household_params}, client) do
    household_params =
      household_params
      |> Map.put("client_id", client.id)

    case Residence.create_household(household_params) do
      {:ok, household} ->
        conn
        |> put_flash(:info, "Household created successfully.")
        |> redirect(to: client_household_path(conn, :show, client, household))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", client: client, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, client) do
    household = Residence.get_household!(client, id)
    render(conn, "show.html", household: household, client: client)
  end

  def edit(conn, %{"id" => id}, client) do
    household = Residence.get_household!(client, id)
    changeset = Residence.change_household(household)
    render(conn, "edit.html", household: household, changeset: changeset, client: client)
  end

  def update(conn, %{"id" => id, "household" => household_params}, client) do
    household = Residence.get_household!(client, id)

    case Residence.update_household(household, household_params) do
      {:ok, household} ->
        conn
        |> put_flash(:info, "Household updated successfully.")
        |> redirect(to: client_household_path(conn, :show, client, household))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", client: client, household: household, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, client) do
    household = Residence.get_household!(client, id)
    {:ok, _household} = Residence.delete_household(household)

    conn
    |> put_flash(:info, "Household deleted successfully.")
    |> redirect(to: client_household_path(conn, :index, client))
  end
end
