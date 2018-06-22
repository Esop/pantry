defmodule Pantry.Repo.Migrations.AddAgeGroupsToResidences do
  use Ecto.Migration

  def change do
    alter(table("residences")) do
    add(:zero_five, :integer)
    add(:six_twelve, :integer)
    add(:thirteen_eighteen, :integer)
    add(:nineteen_twentyfive, :integer)
    add(:twentysix_thirtynine, :integer)
    add(:fourty_fiftyfour, :integer)
    add(:fiftyfive_and_over, :integer)
  end
end
end
