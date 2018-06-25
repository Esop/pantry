defmodule Pantry.Repo.Migrations.RemoveTotalFamilySizeFromClients do
  use Ecto.Migration

  def change do
    alter table("clients") do
      remove(:total_family_size)
    end
  end
end
