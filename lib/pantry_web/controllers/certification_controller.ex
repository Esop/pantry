defmodule PantryWeb.CertificationController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.Certification

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
    certifications = Forms.list_certifications(client)
    render(conn, "index.html", certifications: certifications, client: client)
  end

  def new(conn, _params, client) do
    changeset =
      %Certification{client_id: client.id}
      |> Forms.change_certification()

    render(conn, "new.html", client: client, changeset: changeset)
  end

  def create(conn, %{"certification" => certification_params}, client) do
    certification_params =
      certification_params
      |> Map.put("client_id", client.id)

    case Forms.create_certification(certification_params) do
      {:ok, certification} ->
        conn
        |> put_flash(:info, "Certification created successfully.")
        |> redirect(to: client_certification_path(conn, :show, client, certification))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, client: client)
    end
  end

  def show(conn, %{"id" => id}, client) do
    certification = Forms.get_certification!(client, id)
    render(conn, "show.html", client: client, certification: certification)
  end

  def edit(conn, %{"id" => id}, client) do
    certification = Forms.get_certification!(client, id)
    changeset = Forms.change_certification(certification)
    render(conn, "edit.html", client: client, certification: certification, changeset: changeset)
  end

  def update(conn, %{"id" => id, "certification" => certification_params}, client) do
    certification = Forms.get_certification!(client, id)

    case Forms.update_certification(certification, certification_params) do
      {:ok, certification} ->
        conn
        |> put_flash(:info, "Certification updated successfully.")
        |> redirect(to: client_certification_path(conn, :show, client, certification))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(
          conn,
          "edit.html",
          client: client,
          certification: certification,
          changeset: changeset
        )
    end
  end

  def delete(conn, %{"id" => id}, client) do
    certification = Forms.get_certification!(client, id)
    {:ok, _certification} = Forms.delete_certification(certification)

    conn
    |> put_flash(:info, "Certification deleted successfully.")
    |> redirect(to: client_certification_path(conn, :index ,client))
  end
end
