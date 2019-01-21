defmodule Pantry.Repo.Migrations.RemoveRedundantFieldsFromCertification do
  use Ecto.Migration

  def up do
    alter table(:certifications) do
      add(:address, :string)
      add(:county, :string)
      add(:first_name, :string)
      add(:last_name, :string)
    end
  end

  def down do
    alter table(:certifications) do
      remove(:address)
      remove(:county)
      remove(:first_name)
      remove(:last_name)
    end
  end
end
