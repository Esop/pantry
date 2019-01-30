defmodule Pantry.Repo.Migrations.DropDashboardTable do
  use Ecto.Migration

  def change do
    drop(table(:dashboards))
  end
end
