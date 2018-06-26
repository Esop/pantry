defmodule PantryWeb.CertificationController do
  use PantryWeb, :controller

  alias Pantry.Forms
  alias Pantry.Forms.Certification

  def index(conn, _params) do
    certifications = Forms.list_certifications()
    render(conn, "index.html", certifications: certifications)
  end

  def new(conn, _params) do
    changeset = Forms.change_certification(%Certification{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"certification" => certification_params}) do
    case Forms.create_certification(certification_params) do
      {:ok, certification} ->
        conn
        |> put_flash(:info, "Certification created successfully.")
        |> redirect(to: certification_path(conn, :show, certification))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    certification = Forms.get_certification!(id)
    render(conn, "show.html", certification: certification)
  end

  def edit(conn, %{"id" => id}) do
    certification = Forms.get_certification!(id)
    changeset = Forms.change_certification(certification)
    render(conn, "edit.html", certification: certification, changeset: changeset)
  end

  def update(conn, %{"id" => id, "certification" => certification_params}) do
    certification = Forms.get_certification!(id)

    case Forms.update_certification(certification, certification_params) do
      {:ok, certification} ->
        conn
        |> put_flash(:info, "Certification updated successfully.")
        |> redirect(to: certification_path(conn, :show, certification))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", certification: certification, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    certification = Forms.get_certification!(id)
    {:ok, _certification} = Forms.delete_certification(certification)

    conn
    |> put_flash(:info, "Certification deleted successfully.")
    |> redirect(to: certification_path(conn, :index))
  end
end
