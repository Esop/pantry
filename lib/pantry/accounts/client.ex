defmodule Pantry.Accounts.Client do
  use Ecto.Schema
  import Ecto.Changeset


  schema "clients" do
    field :address, :string
    field :city, :string
    field :county, :string
    field :ethnicity, :string
    field :first_name, :string
    field :last_name, :string
    field :last_visit, :naive_datetime
    field :state, :string
    field :telephone, :string
    field :zip_code, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:first_name, :last_name, :address, :county, :city, :state, :zip_code, :telephone, :ethnicity, :last_visit])
    |> validate_required([:first_name, :last_name, :address, :county, :city, :state, :zip_code, :telephone, :ethnicity, :last_visit])
  end
end
