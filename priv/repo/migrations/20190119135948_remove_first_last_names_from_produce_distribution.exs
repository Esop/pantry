defmodule Pantry.Repo.Migrations.RemoveFirstLastNamesFromProduceDistribution do
  use Ecto.Migration

  def change do
    alter table(:produce_distributions) do
      remove(:first_name)
      remove(:last_name)
    end
  end
end
