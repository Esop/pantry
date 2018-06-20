defmodule Pantry.Residence.Household do
  use Ecto.Schema
  import Ecto.Changeset

  schema "residences" do
    field(:city, :string)
    field(:county, :string)
    field(:state, :string)
    field(:street_address, :string)
    field(:total_members, :integer)
    field(:zip_code, :string)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(household, attrs) do
    household
    |> cast(attrs, [:total_members, :street_address, :city, :county, :zip_code, :state, :client_id])
    |> validate_required([:total_members, :street_address, :city, :county, :zip_code, :state, :client_id])
  end
end
