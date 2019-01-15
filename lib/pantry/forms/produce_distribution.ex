defmodule Pantry.Forms.ProduceDistribution do
  @moduledoc """
    The schema for ProduceDistribution
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "produce_distributions" do
    field(:first_name, :string)
    field(:food_stamps, :boolean, default: false)
    field(:income_eligibility, :boolean, default: false)
    field(:last_name, :string)
    field(:public_housing, :boolean, default: false)
    field(:signature, :string)
    field(:ssi_medicaid, :boolean, default: false)
    field(:temporary_assistance, :boolean)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(produce_distribution, attrs) do
    produce_distribution
    |> cast(attrs, [
      :first_name,
      :last_name,
      :income_eligibility,
      :food_stamps,
      :temporary_assistance,
      :ssi_medicaid,
      :public_housing,
      :signature,
      :client_id
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :income_eligibility,
      :food_stamps,
      :temporary_assistance,
      :ssi_medicaid,
      :public_housing,
      :signature,
      :client_id
    ])
  end
end
