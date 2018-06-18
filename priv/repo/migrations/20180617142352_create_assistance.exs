defmodule Pantry.Repo.Migrations.CreateAssistance do
  use Ecto.Migration

  def change do
    create table(:assistance) do
      add(:received_voucher, :boolean, default: false, null: false)
      add(:received_food, :boolean, default: false, null: false)
      add(:next_service_date, :date)
      add(:client_id, references(:clients, on_delete: :nothing))

      timestamps()
    end

    create(index(:assistance, [:client_id]))
  end
end
