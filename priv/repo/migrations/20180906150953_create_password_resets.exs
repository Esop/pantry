defmodule Pantry.Repo.Migrations.CreatePasswordResets do
  use Ecto.Migration

  def change do
    create table(:password_resets) do
      add(:key, :string, null: false)
      add(:primary_email, :string, null: false)
      add(:volunteer_id, references(:volunteers))

      timestamps(updated_at: false)
    end

    create(index(:password_resets, [:volunteer_id]))
  end
end
