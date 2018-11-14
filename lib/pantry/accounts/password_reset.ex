defmodule Pantry.Accounts.PasswordReset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "password_resets" do
    field(:volunteer_id, :id)
    field(:expires_at, :naive_datetime)

    timestamps(updated_at: false)
  end

  def changeset(volunteer, email) do
    change(volunteer, %{
      key: PantryWeb.Auth.gen_key(),
      primary_email: email
    })
  end
end
