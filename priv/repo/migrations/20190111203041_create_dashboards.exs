defmodule Pantry.Repo.Migrations.CreateDashboards do
  use Ecto.Migration

  def change do
    create table(:dashboards) do
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:dashboards, [:client_id])
  end
end
