defmodule Pantry.Accounts.Volunteer do
  @moduledoc """
   Volunteers manage the clients in this application
  they can edit and delete records
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt

  schema "volunteers" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:password_confirmation, :string, virtual: true)
    field(:password, :string, virtual: true)
    field(:admin, :boolean, default: true)

    has_many(:password_resets, Pantry.Accounts.PasswordReset)

    timestamps()
  end

  @doc false
  def volunteer_registration_changeset(volunteer, attrs) do
    volunteer
    |> cast(attrs, [:first_name, :last_name, :email, :password, :password_confirmation])
    |> validate_required([:first_name, :last_name, :email, :password, :password_confirmation])
    |> confirm_passwords_are_equal()
    |> put_pass_hash()
  end

  def volunteer_update_changeset(volunteer, attrs) do
    volunteer
    |> cast(attrs, [:first_name, :last_name, :email, :password, :password_confirmation])
    |> validate_required([:password_confirmation, :password])
    |> confirm_passwords_are_equal()
    |> put_pass_hash()
  end

  def confirm_passwords_are_equal(changeset) do
    case changeset do
      %Ecto.Changeset{
        changes: %{password: password, password_confirmation: password_confirmation}
      } ->
        if password != password_confirmation do
          Ecto.Changeset.add_error(changeset, :password, "passwords are not equal")
        else
          changeset
        end

      _ ->
        changeset
    end
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def password_reset_init(email) do
    import Ecto

    if volunteer = Pantry.Accounts.get_user_by_email(email) do
      changeset =
        Pantry.Accounts.PasswordReset.changeset(build_assoc(volunteer, :password_resets), email)

      {:ok, %{reset: reset}} =
        Ecto.Multi.new()
        |> Ecto.Multi.insert(:reset, changeset)
        |> Pantry.Repo.transaction()

      Pantry.Emails.Email.reset_password_email(email, reset)
      |> Pantry.Emails.Mailer.deliver_now()
    else
      {:error, :not_found}
    end
  end
end
