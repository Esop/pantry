defmodule Pantry.Residence.Household do
  use Ecto.Schema
  import Ecto.Changeset

  schema "residences" do
    field(:total_members, :integer, default: 0)
    field(:zero_five, :integer, default: 0)
    field(:six_twelve, :integer, default: 0)
    field(:thirteen_eighteen, :integer, default: 0)
    field(:nineteen_twentyfive, :integer, default: 0)
    field(:twentysix_thirtynine, :integer, default: 0)
    field(:fourty_fiftyfour, :integer, default: 0)
    field(:fiftyfive_and_over, :integer, default: 0)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(household, attrs) do
    household
    |> cast(attrs, [
      :total_members,
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
