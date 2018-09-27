defmodule Pantry.Accounts.Client do
  @moduledoc """
  Clients are managed by Volunteers
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "clients" do
    field(:ethnicity, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:telephone, :string)
    field(:description_of_need, :string)
    field(:notes, :string)

    has_many(:Assistance, Pantry.Forms.Assistance)
    # FIXME: If I call has_one my routes are broken
    # has_one(:Household, Pantry.Residence.Household)
    has_many(:Household, Pantry.Residence.Household)
    has_many(:Certification, Pantry.Forms.Certification)
    has_many(:ProduceDistribution, Pantry.Forms.ProduceDistribution)

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [
      :first_name,
      :last_name,
      :telephone,
      :ethnicity,
      :description_of_need,
      :notes
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :telephone,
      :ethnicity
    ])
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from(
      client in query,
      where: ilike(client.first_name, ^wildcard_search),
      or_where: ilike(client.last_name, ^wildcard_search)
    )
  end

  def sort_clients(:first_name = sort ) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.first_name ])
    |> Pantry.Repo.all
  end

  def sort_clients(:last_name = sort) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.last_name ])
    |> Pantry.Repo.all
  end

  def sort_clients(:inserted_at = sort ) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.inserted_at ])
    |> Pantry.Repo.all
  end
end
