defmodule Pantry.Accounts.Volunteer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volunteers" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:admin, :boolean, default: true)

    timestamps()
  end

  @doc false
  def changeset(volunteer, attrs) do
    volunteer
    |> cast(attrs, [:first_name, :last_name, :email, :password_hash])
    |> validate_required([:first_name, :last_name, :email, :password_hash])
  end
end
