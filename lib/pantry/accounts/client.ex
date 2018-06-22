defmodule Pantry.Accounts.Client do
  @moduledoc """
  Clients are managed by Volunteers
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field(:ethnicity, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:telephone, :string)
    field(:total_family_size, :integer, default: 0)
    field(:description_of_need, :string)
    field(:notes, :string)

    has_many(:Assistance, Pantry.Forms.Assistance)
    # FIXME: If I call has_one my routes are broken
    # has_one(:Household, Pantry.Residence.Household)
    has_many(:Household, Pantry.Residence.Household)

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
      :total_family_size,
      :description_of_need,
      :notes
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :telephone,
      :ethnicity,
      :total_family_size
    ])
  end
end
