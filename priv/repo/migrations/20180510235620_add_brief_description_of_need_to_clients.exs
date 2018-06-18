defmodule Pantry.Repo.Migrations.AddBriefDescriptionOfNeedToClients do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add(:description_of_need, :string)
    end
  end
end
