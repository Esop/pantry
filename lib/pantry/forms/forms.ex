defmodule Pantry.Forms do
  @moduledoc """
  The Forms context.
  """

  import Ecto.Query, warn: false
  alias Pantry.Repo

  alias Pantry.Forms.Assistance

  @doc """
  Returns the list of assistance.

  ## Examples

      iex> list_assistance()
      [%Assistance{}, ...]

  """
  def list_assistance(client) do
    Assistance
    |> where([t], t.client_id == ^client.id)
    |> Repo.all()
  end

  @doc """
  Gets a single assistance.

  Raises `Ecto.NoResultsError` if the Assistance does not exist.

  ## Examples

      iex> get_assistance!(123)
      %Assistance{}

      iex> get_assistance!(456)
      ** (Ecto.NoResultsError)

  """

  def get_assistance!(client, id) do
    Assistance
    |> where([t], t.client_id == ^client.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a assistance.

  ## Examples

      iex> create_assistance(%{field: value})
      {:ok, %Assistance{}}

      iex> create_assistance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assistance(attrs \\ %{}) do
    %Assistance{}
    |> Assistance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assistance.

  ## Examples

      iex> update_assistance(assistance, %{field: new_value})
      {:ok, %Assistance{}}

      iex> update_assistance(assistance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assistance(%Assistance{} = assistance, attrs) do
    assistance
    |> Assistance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Assistance.

  ## Examples

      iex> delete_assistance(assistance)
      {:ok, %Assistance{}}

      iex> delete_assistance(assistance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assistance(%Assistance{} = assistance) do
    Repo.delete(assistance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assistance changes.

  ## Examples

      iex> change_assistance(assistance)
      %Ecto.Changeset{source: %Assistance{}}

  """
  def change_assistance(%Assistance{} = assistance) do
    Assistance.changeset(assistance, %{})
  end
end
