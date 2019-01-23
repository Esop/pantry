defmodule Pantry.Repo.Migrations.RemoveFamilySizeFromCertifications do
  use Ecto.Migration

  def change do
    alter table(:certifications) do
      remove(:family_size)
    end
  end
end
