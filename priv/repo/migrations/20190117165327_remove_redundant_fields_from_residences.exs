defmodule Pantry.Repo.Migrations.RemoveRedundantFieldsFromResidences do
  use Ecto.Migration

  def change do
    alter table(:residences) do
      remove(:city)
      remove(:county)
      remove(:state)
      remove(:street_address)
    end
  end
end
