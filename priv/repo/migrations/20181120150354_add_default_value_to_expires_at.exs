defmodule Pantry.Repo.Migrations.AddDefaultValueToExpiresAt do
  use Ecto.Migration

  def change do
    alter(table(:password_resets)) do
      remove(:expires_at)
      add(:expires_at, :naive_datetime, null: false, default: fragment("now()"))
    end
  end
end
