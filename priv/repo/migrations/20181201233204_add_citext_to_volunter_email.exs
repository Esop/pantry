defmodule Pantry.Repo.Migrations.AddCitextToVolunterEmail do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext")

    alter(table(:volunteers)) do
      modify(:email, :citext)
    end

    create(unique_index(:volunteers, [:email]))
  end
end
