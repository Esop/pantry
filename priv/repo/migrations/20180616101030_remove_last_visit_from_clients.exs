defmodule Pantry.Repo.Migrations.RemoveLastVisitFromClients do
  use Ecto.Migration

  def change do
    alter table("clients") do
      remove(:last_visit)
    end

  end
end
