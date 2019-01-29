defmodule Pantry.Repo.Migrations.CreateCertifications do
  use Ecto.Migration

  def change do
    create table(:certifications) do
      add :family_size, :integer
      add :income_eligibility, :boolean, default: false, null: false
      add :supplemental_nutrition_assistance, :boolean, default: false, null: false
      add :temporary_assistance_to_needy_families, :boolean, default: false, null: false
      add :supplemental_security_income, :boolean, default: false, null: false
      add :medicaid, :boolean, default: false, null: false
      add :clients_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:certifications, [:clients_id])
  end
end
