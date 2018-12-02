defmodule Pantry.Repo.Migrations.ChangePasswordReset do
  use Ecto.Migration

  def change do
    alter(table(:password_resets)) do
      add(:expires_at, :naive_datetime, null: false)
      remove(:primary_email)
      remove(:key)
    end
  end
end
