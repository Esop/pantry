defmodule Pantry.Repo.Migrations.AddDefaultsToResidences do
  use Ecto.Migration

  def change do
    alter table("residences") do
      modify(:city, :string , default: "", null: false)
      modify(:county,:string, default: "", null: false)
      modify(:state, :string, default: "", null: false)
      modify(:street_address,:string, default: "", null: false)
      modify(:total_members,:integer, default: 0, null: false)
      modify(:zip_code, :string, default: "", null: false)
      modify(:zero_five, :integer, default: 0, null: false)
      modify(:six_twelve, :integer, default: 0, null: false)
      modify(:thirteen_eighteen, :integer, default: 0, null: false)
      modify(:nineteen_twentyfive, :integer, default: 0, null: false)
      modify(:twentysix_thirtynine, :integer, default: 0, null: false)
      modify(:fourty_fiftyfour, :integer, default: 0, null: false)
      modify(:fiftyfive_and_over, :integer, default: 0, null: false)
    end
  end
end
