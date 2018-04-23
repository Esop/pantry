defmodule Pantry.Repo.Migrations.CreateVolunteers do
  use Ecto.Migration

  def change do
    create table(:volunteers) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:email, :string)
      add(:password_hash, :string)
      add(:admin, :boolean, default: true)

      timestamps()
    end
  end
end
