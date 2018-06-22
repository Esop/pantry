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
    field(:zero_five, :integer)
    field(:six_twelve, :integer)
    field(:thirteen_eighteen, :integer)
    field(:nineteen_twentyfive, :integer)
    field(:twentysix_thirtynine, :integer)
    field(:fourty_fiftyfour, :integer)
    field(:fiftyfive_and_over, :integer)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(household, attrs) do
    household
    |> cast(attrs, [
      :total_members,
      :street_address,
      :city,
      :county,
      :zip_code,
      :state,
      :client_id,
      :zero_five,
      :six_twelve,
      :thirteen_eighteen,
      :nineteen_twentyfive,
      :twentysix_thirtynine,
      :fourty_fiftyfour,
      :fiftyfive_and_over
    ])
    |> validate_required([
      :total_members,
      :street_address,
      :city,
      :county,
      :zip_code,
      :state,
      :client_id,
      :zero_five,
      :six_twelve,
      :thirteen_eighteen,
      :nineteen_twentyfive,
      :twentysix_thirtynine,
      :fourty_fiftyfour,
      :fiftyfive_and_over
    ])
  end
end
