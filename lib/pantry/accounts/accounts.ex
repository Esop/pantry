defmodule Pantry.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Pantry.Repo

  alias Pantry.Accounts.Client
  alias Pantry.Accounts.Volunteer

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{source: %Client{}}

  """
  def change_client(%Client{} = client) do
    Client.changeset(client, %{})
  end

  alias Pantry.Accounts.Volunteer

  @doc """
  Returns the list of volunteers.

  ## Examples

      iex> list_volunteers()
      [%Volunteer{}, ...]

  """
  def list_volunteers do
    Repo.all(Volunteer)
  end

  @doc """
  Gets a single volunteer.

  Raises `Ecto.NoResultsError` if the Volunteer does not exist.

  ## Examples

      iex> get_volunteer!(123)
      %Volunteer{}

      iex> get_volunteer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_volunteer!(id), do: Repo.get!(Volunteer, id)

  @doc """
  Creates a volunteer.

  ## Examples

      iex> create_volunteer(%{field: value})
      {:ok, %Volunteer{}}

      iex> create_volunteer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_volunteer(attrs \\ %{}) do
    %Volunteer{}
    |> Volunteer.volunteer_registration_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a volunteer.

  ## Examples

      iex> update_volunteer(volunteer, %{field: new_value})
      {:ok, %Volunteer{}}

      iex> update_volunteer(volunteer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_volunteer(%Volunteer{} = volunteer, attrs) do
    volunteer
    |> Volunteer.volunteer_update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Volunteer.

  ## Examples

      iex> delete_volunteer(volunteer)
      {:ok, %Volunteer{}}

      iex> delete_volunteer(volunteer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_volunteer(%Volunteer{} = volunteer) do
    Repo.delete(volunteer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking volunteer changes.

  ## Examples

      iex> change_volunteer(volunteer)
      %Ecto.Changeset{source: %Volunteer{}}

  """
  def change_volunteer(%Volunteer{} = volunteer) do
    Volunteer.volunteer_registration_changeset(volunteer, %{})
  end

  def get_user_by_email(email) do
    Repo.get_by(Volunteer, email: email)
  end
end
