defmodule Pantry.Residence do
  @moduledoc """
  The Residence context.
  """

  import Ecto.Query, warn: false
  alias Pantry.Repo

  alias Pantry.Residence.Household

  @doc """
  Returns the list of residences.

  ## Examples

      iex> list_residences()
      [%Household{}, ...]

  """
  def list_residences(client) do
    Household
    |> where([t], t.client_id == ^client.id)
    |> preload(:client)
    |> Repo.all()
  end

  @doc """
  Gets a single household.

  Raises `Ecto.NoResultsError` if the Household does not exist.

  ## Examples

      iex> get_household!(123)
      %Household{}

      iex> get_household!(456)
      ** (Ecto.NoResultsError)

  """
  def get_household!(client, id) do
    Household
    |> where([t], t.client_id == ^client.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a household.

  ## Examples

      iex> create_household(%{field: value})
      {:ok, %Household{}}

      iex> create_household(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_household(attrs \\ %{}) do
    %Household{}
    |> Household.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a household.

  ## Examples

      iex> update_household(household, %{field: new_value})
      {:ok, %Household{}}

      iex> update_household(household, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_household(%Household{} = household, attrs) do
    household
    |> Household.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Household.

  ## Examples

      iex> delete_household(household)
      {:ok, %Household{}}

      iex> delete_household(household)
      {:error, %Ecto.Changeset{}}

  """
  def delete_household(%Household{} = household) do
    Repo.delete(household)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking household changes.

  ## Examples

      iex> change_household(household)
      %Ecto.Changeset{source: %Household{}}

  """
  def change_household(%Household{} = household) do
    Household.changeset(household, %{})
  end

end
