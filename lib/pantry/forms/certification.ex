defmodule Pantry.Forms.Certification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "certifications" do
    field(:income_eligibility, :boolean, default: false)
    field(:medicaid, :boolean, default: false)
    field(:supplemental_nutrition_assistance, :boolean, default: false)
    field(:supplemental_security_income, :boolean, default: false)
    field(:temporary_assistance_to_needy_families, :boolean, default: false)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(certification, attrs) do
    certification
    |> cast(attrs, [
      :income_eligibility,
      :supplemental_nutrition_assistance,
      :temporary_assistance_to_needy_families,
      :supplemental_security_income,
      :medicaid,
      :client_id
    ])
    |> validate_required([
      :income_eligibility,
      :supplemental_nutrition_assistance,
      :temporary_assistance_to_needy_families,
      :supplemental_security_income,
      :medicaid,
      :client_id
    ])
  end
end
