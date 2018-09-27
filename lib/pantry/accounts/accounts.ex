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
  def list_clients(params) do
    search_term = get_in(params, ["query"])


    Client
    |> Client.search(search_term)
    |> Repo.all()
  end

  def search(params) do
    Client
    |> Client.search(params)
    # |> sort()
  end

  defp sort(query, :first_name) do
    from(c in query, order_by: [desc: c.first_name])
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

  alias Pantry.Accounts.PasswordReset

  @doc """
  Returns the list of password_resets.

  ## Examples

      iex> list_password_resets()
      [%PasswordReset{}, ...]

  """
  def list_password_resets do
    Repo.all(PasswordReset)
  end

  @doc """
  Gets a single password_reset.

  Raises `Ecto.NoResultsError` if the Password reset does not exist.

  ## Examples

      iex> get_password_reset!(123)
      %PasswordReset{}

      iex> get_password_reset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_password_reset!(id), do: Repo.get!(PasswordReset, id)

  @doc """
  Creates a password_reset.

  ## Examples

      iex> create_password_reset(%{field: value})
      {:ok, %PasswordReset{}}

      iex> create_password_reset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_password_reset(attrs \\ %{}) do
    %PasswordReset{}
    |> PasswordReset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a password_reset.

  ## Examples

      iex> update_password_reset(password_reset, %{field: new_value})
      {:ok, %PasswordReset{}}

      iex> update_password_reset(password_reset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_password_reset(%PasswordReset{} = password_reset, attrs) do
    password_reset
    |> PasswordReset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PasswordReset.

  ## Examples

      iex> delete_password_reset(password_reset)
      {:ok, %PasswordReset{}}

      iex> delete_password_reset(password_reset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_password_reset(%PasswordReset{} = password_reset) do
    Repo.delete(password_reset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking password_reset changes.

  ## Examples

      iex> change_password_reset(password_reset)
      %Ecto.Changeset{source: %PasswordReset{}}

  """
  def change_password_reset(%PasswordReset{} = password_reset) do
    PasswordReset.changeset(password_reset, %{})
  end
end
