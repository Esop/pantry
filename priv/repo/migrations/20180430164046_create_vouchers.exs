defmodule Pantry.Repo.Migrations.CreateVouchers do
  use Ecto.Migration

  def change do
    create table(:vouchers) do
      add :received_money, :boolean, default: false, null: false
      add :received_food, :boolean, default: false, null: false
      add :voucher_amount, :string
      add :next_service_date, :date
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:vouchers, [:client_id])
  end
end
