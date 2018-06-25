defmodule Pantry.Forms.ProduceDistribution do
  use Ecto.Schema
  import Ecto.Changeset


  schema "produce_distributions" do
    field :first_name, :string
    field :food_stamps, :boolean, default: false
    field :income_eligibility, :boolean, default: false
    field :last_name, :string
    field :public_housing, :string
    field :signature, :string
    field :ssi_medicaid, :string
    field :temporary_assistance, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(produce_distribution, attrs) do
    produce_distribution
    |> cast(attrs, [:first_name, :last_name, :income_eligibility, :food_stamps, :temporary_assistance, :ssi_medicaid, :public_housing, :signature])
    |> validate_required([:first_name, :last_name, :income_eligibility, :food_stamps, :temporary_assistance, :ssi_medicaid, :public_housing, :signature])
  end
end
