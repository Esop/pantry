defmodule Pantry.Repo.Migrations.CreateProduceDistributions do
  use Ecto.Migration

  def change do
    create table(:produce_distributions) do
      add :first_name, :string
      add :last_name, :string
      add :income_eligibility, :boolean, default: false, null: false
      add :food_stamps, :boolean, default: false, null: false
      add :temporary_assistance, :string
      add :ssi_medicaid, :string
      add :public_housing, :string
      add :signature, :string
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:produce_distributions, [:client_id])
  end
end
