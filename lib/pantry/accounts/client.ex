defmodule Pantry.Accounts.Client do
  @moduledoc """
  Clients are managed by Volunteers
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "clients" do
    # FIXME: If I call has_one my routes are broken
    # has_one(:Household, Pantry.Residence.Household)
    field(:address, :string)
    field(:city, :string)
    field(:county, :string)
    field(:description_of_need, :string)
    field(:ethnicity, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:notes, :string)
    field(:state, :string)
    field(:telephone, :string)
    field(:zipcode, :string)
    has_many(:assistance, Pantry.Forms.Assistance)
    has_many(:certification, Pantry.Forms.Certification)
    has_many(:household, Pantry.Residence.Household)
    has_many(:produce_distributions, Pantry.Forms.ProduceDistribution)
    has_one(:dashboard, Pantry.Accounts.Dashboard)

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [
      :address,
      :city,
      :county,
      :description_of_need,
      :ethnicity,
      :first_name,
      :last_name,
      :notes,
      :state,
      :telephone,
      :zipcode
    ])
    |> validate_required([
      :ethnicity,
      :first_name,
      :last_name,
      :telephone
    ])
  end

  ## Sorting functions
  # I think these functions should be moved
  # to another module because they touch the databass
  # def sort_clients(:first_name = sort, search) do
  def sort_clients(:first_name = sort, search) when is_atom(sort) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.first_name])
    |> search(search)
    |> Pantry.Repo.all()
  end

  def sort_clients(:last_name = sort, search) when is_atom(sort) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.last_name])
    |> search(search)
    |> Pantry.Repo.all()
  end

  def sort_clients(:inserted_at = sort, search) when is_atom(sort) do
    from(c in Pantry.Accounts.Client, order_by: [asc: c.inserted_at])
    |> search(search)
    |> Pantry.Repo.all()
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from(
      client in query,
      where: ilike(client.first_name, ^wildcard_search),
      or_where: ilike(client.last_name, ^wildcard_search)
    )
  end
end
