defmodule Pantry.Forms do
  @moduledoc """
  The Forms context.
  """

  import Ecto.Query, warn: false
  alias Pantry.Repo

  alias Pantry.Forms.Voucher

  @doc """
  Returns the list of vouchers
  for the client.

  ## Examples

      iex> list_vouchers(client)
      [%Voucher{}, ...]

  """
  def list_vouchers(client) do
    Voucher
    |> where([v], v.client_id == ^client.id)
    |> Repo.all()
  end

  @doc """
  Gets a single voucher.

  Raises `Ecto.NoResultsError` if the Voucher does not exist.

  ## Examples

      iex> get_voucher!(123)
      %Voucher{}

      iex> get_voucher!(456)
      ** (Ecto.NoResultsError)

  """
  def get_voucher!(client, id) do
    Voucher
    |> where([t], t.client_id == ^client.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a voucher.

  ## Examples

      iex> create_voucher(%{field: value})
      {:ok, %Voucher{}}

      iex> create_voucher(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_voucher(attrs \\ %{}) do
    %Voucher{}
    |> Voucher.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a voucher.

  ## Examples

      iex> update_voucher(voucher, %{field: new_value})
      {:ok, %Voucher{}}

      iex> update_voucher(voucher, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_voucher(%Voucher{} = voucher, attrs) do
    voucher
    |> Voucher.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Voucher.

  ## Examples

      iex> delete_voucher(voucher)
      {:ok, %Voucher{}}

      iex> delete_voucher(voucher)
      {:error, %Ecto.Changeset{}}

  """
  def delete_voucher(%Voucher{} = voucher) do
    Repo.delete(voucher)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking voucher changes.

  ## Examples

      iex> change_voucher(voucher)
      %Ecto.Changeset{source: %Voucher{}}

  """
  def change_voucher(%Voucher{} = voucher) do
    Voucher.changeset(voucher, %{})
  end
end
