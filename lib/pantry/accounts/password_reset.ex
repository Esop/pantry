defmodule Pantry.Accounts.PasswordReset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "password_resets" do
    field(:key, :string)
    field(:primary_email, :string)
    field(:volunteer_id, :id)

    timestamps(updated_at: false)
  end

  def changeset(volunteer, email) do
    change(volunteer, %{
      key: PantryWeb.Auth.gen_key(),
      primary_email: email
    })
  end
end
