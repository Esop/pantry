defmodule Pantry.Accounts.PasswordReset do
  @moduledoc """
  PasswordReset schema module
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Pantry.Accounts.Volunteer

  schema "password_resets" do
    # field(:volunteer_id, :id)
    field(:expires_at, :naive_datetime)
    belongs_to(:volunteer, Volunteer)
    timestamps(updated_at: false)
  end

  def reset_password_changeset(%Volunteer{} = struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:password, :password_confirmation])
    |> validate_required([:password, :password_confirmation])
    |> validate_length(:password, min: 6)
    |> Volunteer.confirm_passwords_are_equal()
    |> Volunteer.put_pass_hash()
  end
end
