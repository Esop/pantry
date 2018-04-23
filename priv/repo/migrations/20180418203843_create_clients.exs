defmodule Pantry.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :first_name, :string
      add :last_name, :string
      add :address, :string
      add :county, :string
      add :city, :string
      add :state, :string
      add :zip_code, :string
      add :telephone, :string
      add :ethnicity, :string
      add :last_visit, :naive_datetime

      timestamps()
    end

  end
end
