defmodule Pantry.Repo.Migrations.RemoveFieldsFromClients do
  use Ecto.Migration

  def change do
    alter table("clients") do
      remove(:address)
      remove(:city)
      remove(:county)
      remove(:zip_code)
      remove(:state)

    end

  end
end
