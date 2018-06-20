defmodule Pantry.Repo.Migrations.CreateResidences do
  use Ecto.Migration

  def change do
    create table(:residences) do
      add(:total_members, :integer)
      add(:street_address, :string)
      add(:city, :string)
      add(:county, :string)
      add(:zip_code, :string)
      add(:state, :string)
      add(:client_id, references(:clients, on_delete: :nothing))

      timestamps()
    end

    create(index(:residences, [:client_id]))
  end
end
