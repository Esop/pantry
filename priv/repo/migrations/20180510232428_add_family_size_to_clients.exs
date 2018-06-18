defmodule Pantry.Repo.Migrations.AddFamilySizeToClients do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add(:total_family_size, :integer)
    end
  end
end
