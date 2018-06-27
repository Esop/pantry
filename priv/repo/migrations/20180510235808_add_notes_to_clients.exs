defmodule Pantry.Repo.Migrations.AddNotesToClients do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add(:notes, :string)
    end
  end
end
