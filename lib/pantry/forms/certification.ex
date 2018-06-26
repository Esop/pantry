defmodule Pantry.Forms.Certification do
  use Ecto.Schema
  import Ecto.Changeset


  schema "certifications" do
    field :address, :string
    field :county, :string
    field :family_size, :integer
    field :first_name, :string
    field :income_eligibility, :boolean, default: false
    field :last_name, :string
    field :medicaid, :boolean, default: false
    field :supplemental_nutrition_assistance, :boolean, default: false
    field :supplemental_security_income, :boolean, default: false
    field :temporary_assistance_to_needy_families, :boolean, default: false
    field :clients_id, :id

    timestamps()
  end

  @doc false
  def changeset(certification, attrs) do
    certification
    |> cast(attrs, [:first_name, :last_name, :address, :county, :family_size, :income_eligibility, :supplemental_nutrition_assistance, :temporary_assistance_to_needy_families, :supplemental_security_income, :medicaid])
    |> validate_required([:first_name, :last_name, :address, :county, :family_size, :income_eligibility, :supplemental_nutrition_assistance, :temporary_assistance_to_needy_families, :supplemental_security_income, :medicaid])
  end
end
