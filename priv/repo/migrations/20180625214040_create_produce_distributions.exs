defmodule Pantry.Repo.Migrations.CreateProduceDistributions do
  use Ecto.Migration

  def change do
    create table(:produce_distributions) do
      add :first_name, :string
      add :last_name, :string
      add :income_eligibility, :boolean, default: false, null: false
      add :food_stamps, :boolean, default: false, null: false
      add :temporary_assistance, :boolean, default: false, null: false
      add :ssi_medicaid, :boolean, default: false, null: false
      add :public_housing, :boolean, default: false, null: false
      add :signature, :string
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:produce_distributions, [:client_id])
  end
end
