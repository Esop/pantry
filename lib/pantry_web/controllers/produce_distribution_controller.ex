
defmodule PantryWeb.ProduceDistributionController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.ProduceDistribution

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
    produce_distributions = Forms.list_produce_distributions(client)
    render(conn, "index.html", produce_distributions: produce_distributions, client: client)
  end

  def new(conn, _params, client) do
    changeset =
      %ProduceDistribution{client_id: client.id}
      |> Forms.change_produce_distribution()

    render(conn, "new.html", changeset: changeset, client: client)
  end

  def create(conn, %{"produce_distribution" => produce_distribution_params}, client) do
    produce_distribution_params =
      produce_distribution_params
      |> Map.put("client_id", client.id)

    case Forms.create_produce_distribution(produce_distribution_params) do
      {:ok, produce_distribution} ->
        conn
        |> put_flash(:info, "Produce distribution created successfully.")
        |> redirect(to: client_assistance_path(conn, :index, client))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, client: client)
    end
  end

  def show(conn, %{"id" => id}, client) do
    produce_distribution = Forms.get_produce_distribution!(client, id)
    render(conn, "show.html", produce_distribution: produce_distribution, client: client)
  end

  def edit(conn, %{"id" => id}, client) do
    produce_distribution = Forms.get_produce_distribution!(client, id)
    changeset = Forms.change_produce_distribution(produce_distribution)

    render(
      conn,
      "edit.html",
      produce_distribution: produce_distribution,
      changeset: changeset,
      client: client
    )
  end

  def update(conn, %{"id" => id, "produce_distribution" => produce_distribution_params}, client) do
    produce_distribution = Forms.get_produce_distribution!(client, id)

    case Forms.update_produce_distribution(produce_distribution, produce_distribution_params) do
      {:ok, produce_distribution} ->
        conn
        |> put_flash(:info, "Produce distribution updated successfully.")
        |> redirect(
          to: client_produce_distribution_path(conn, :show, client, produce_distribution)
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(
          conn,
          "edit.html",
          produce_distribution: produce_distribution,
          changeset: changeset,
          client: client
        )
    end
  end

  def delete(conn, %{"id" => id}, client) do
    produce_distribution = Forms.get_produce_distribution!(client, id)
    {:ok, _produce_distribution} = Forms.delete_produce_distribution(produce_distribution)

    conn
    |> put_flash(:info, "Produce distribution deleted successfully.")
    |> redirect(to: client_produce_distribution_path(conn, :index, client))
  end
end
