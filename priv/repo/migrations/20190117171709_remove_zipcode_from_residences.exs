defmodule Pantry.Repo.Migrations.RemoveZipcodeFromResidences do
  use Ecto.Migration

  def change do
    alter table(:residences) do
      remove(:zip_code)
    end
  end
end
