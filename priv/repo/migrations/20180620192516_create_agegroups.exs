defmodule Pantry.Repo.Migrations.CreateAgegroups do
  use Ecto.Migration

  def change do
    create table(:agegroups) do
      add(:zero_five, :integer)
      add(:six_twelve, :integer)
      add(:thirteen_eighteen, :integer)
      add(:nineteen_twentyfive, :string)
      add(:twentysix_thirtynine, :integer)
      add(:fourty_fiftyfour, :integer)
      add(:fiftyfive_and_over, :string)
      add(:household_id, references(:residences, on_delete: :nothing))

      timestamps()
    end

    create(index(:agegroups, [:household_id]))
  end
end
