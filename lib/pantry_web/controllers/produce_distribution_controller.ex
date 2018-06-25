defmodule PantryWeb.ProduceDistributionController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.ProduceDistribution

  def index(conn, _params) do
    produce_distributions = Forms.list_produce_distributions()
    render(conn, "index.html", produce_distributions: produce_distributions)
  end

  def new(conn, _params) do
    changeset = Forms.change_produce_distribution(%ProduceDistribution{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"produce_distribution" => produce_distribution_params}) do
    case Forms.create_produce_distribution(produce_distribution_params) do
      {:ok, produce_distribution} ->
        conn
        |> put_flash(:info, "Produce distribution created successfully.")
        |> redirect(to: produce_distribution_path(conn, :show, produce_distribution))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    produce_distribution = Forms.get_produce_distribution!(id)
    render(conn, "show.html", produce_distribution: produce_distribution)
  end

  def edit(conn, %{"id" => id}) do
    produce_distribution = Forms.get_produce_distribution!(id)
    changeset = Forms.change_produce_distribution(produce_distribution)
    render(conn, "edit.html", produce_distribution: produce_distribution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "produce_distribution" => produce_distribution_params}) do
    produce_distribution = Forms.get_produce_distribution!(id)

    case Forms.update_produce_distribution(produce_distribution, produce_distribution_params) do
      {:ok, produce_distribution} ->
        conn
        |> put_flash(:info, "Produce distribution updated successfully.")
        |> redirect(to: produce_distribution_path(conn, :show, produce_distribution))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", produce_distribution: produce_distribution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    produce_distribution = Forms.get_produce_distribution!(id)
    {:ok, _produce_distribution} = Forms.delete_produce_distribution(produce_distribution)

    conn
    |> put_flash(:info, "Produce distribution deleted successfully.")
    |> redirect(to: produce_distribution_path(conn, :index))
  end
end
