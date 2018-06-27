defmodule Pantry.Repo.Migrations.DropAgeGroups do
  use Ecto.Migration

  def change do
    drop(table("agegroups"))
  end
end
