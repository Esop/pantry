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
    id = Map.get(attrs, "client_id")
    client = Pantry.Accounts.get_client!(id)
    assistance_changeset = Ecto.build_assoc(client, :assistance)

    assistance_changeset
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

  alias Pantry.Forms.ProduceDistribution

  @doc """
  Returns the list of produce_distributions.

  ## Examples

      iex> list_produce_distributions()
      [%ProduceDistribution{}, ...]

  """
  def list_produce_distributions(client) do
    ProduceDistribution
    |> where([t], t.client_id == ^client.id)
    |> Repo.all()
  end

  @doc """
  Gets a single produce_distribution.

  Raises `Ecto.NoResultsError` if the Produce distribution does not exist.

  ## Examples

      iex> get_produce_distribution!(123)
      %ProduceDistribution{}

      iex> get_produce_distribution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_produce_distribution!(client, id) do
    ProduceDistribution
    |> where([t], t.client_id == ^client.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a produce_distribution.

  ## Examples

      iex> create_produce_distribution(%{field: value})
      {:ok, %ProduceDistribution{}}

      iex> create_produce_distribution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_produce_distribution(attrs \\ %{}) do
    id = Map.get(attrs, "client_id")
    client = Pantry.Accounts.get_client!(id)
    produce_dis_changeset = Ecto.build_assoc(client, :produce_distributions)

    produce_dis_changeset
    |> ProduceDistribution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a produce_distribution.

  ## Examples

      iex> update_produce_distribution(produce_distribution, %{field: new_value})
      {:ok, %ProduceDistribution{}}

      iex> update_produce_distribution(produce_distribution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_produce_distribution(%ProduceDistribution{} = produce_distribution, attrs) do
    produce_distribution
    |> ProduceDistribution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ProduceDistribution.

  ## Examples

      iex> delete_produce_distribution(produce_distribution)
      {:ok, %ProduceDistribution{}}

      iex> delete_produce_distribution(produce_distribution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_produce_distribution(%ProduceDistribution{} = produce_distribution) do
    Repo.delete(produce_distribution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking produce_distribution changes.

  ## Examples

      iex> change_produce_distribution(produce_distribution)
      %Ecto.Changeset{source: %ProduceDistribution{}}

  """
  def change_produce_distribution(%ProduceDistribution{} = produce_distribution) do
    ProduceDistribution.changeset(produce_distribution, %{})
  end

  alias Pantry.Forms.Certification

  @doc """
  Returns the list of certifications.

  ## Examples

      iex> list_certifications()
      [%Certification{}, ...]

  """
  def list_certifications(client) do
    Certification
    |> where([t], t.client_id == ^client.id)
    |> Repo.all()
  end

  @doc """
  Gets a single certification.

  Raises `Ecto.NoResultsError` if the Certification does not exist.

  ## Examples

      iex> get_certification!(123)
      %Certification{}

      iex> get_certification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_certification!(client, id) do
    Certification
    |> where([t], t.client_id == ^client.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a certification.

  ## Examples

      iex> create_certification(%{field: value})
      {:ok, %Certification{}}

      iex> create_certification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_certification(attrs \\ %{}) do
    id = Map.get(attrs, "client_id")
    client = Pantry.Accounts.get_client!(id)
    certification_changeset = Ecto.build_assoc(client, :certification)

    certification_changeset
    |> Certification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a certification.

  ## Examples

      iex> update_certification(certification, %{field: new_value})
      {:ok, %Certification{}}

      iex> update_certification(certification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_certification(%Certification{} = certification, attrs) do
    certification
    |> Certification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Certification.

  ## Examples

      iex> delete_certification(certification)
      {:ok, %Certification{}}

      iex> delete_certification(certification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_certification(%Certification{} = certification) do
    Repo.delete(certification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking certification changes.

  ## Examples

      iex> change_certification(certification)
      %Ecto.Changeset{source: %Certification{}}

  """
  def change_certification(%Certification{} = certification) do
    Certification.changeset(certification, %{})
  end
end
