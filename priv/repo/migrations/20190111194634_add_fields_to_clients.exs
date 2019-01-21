defmodule Pantry.Repo.Migrations.AddFieldsToClients do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add(:address, :string)
      add(:city, :string)
      add(:county, :string)
      add(:state, :string)
      add(:zipcode, :string)
    end
  end
end
