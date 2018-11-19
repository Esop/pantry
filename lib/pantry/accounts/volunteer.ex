defmodule Pantry.Accounts.Volunteer do
  @moduledoc """
   Volunteers manage the clients in this application
  they can edit and delete records
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Comeonin.Bcrypt
  alias Pantry.Accounts.Volunteer
  alias Pantry.Accounts.PasswordReset

  schema "volunteers" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:password_confirmation, :string, virtual: true)
    field(:password, :string, virtual: true)
    field(:admin, :boolean, default: true)
    has_many(:password_resets, PasswordReset)

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

  def put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def initiate_password_reset(%Volunteer{} = volunteer) do
    one_day_from_now =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.add(60 * 60 * 24)

    %PasswordReset{}
    |> Ecto.Changeset.change(%{volunteer_id: volunteer.id, expires_at: one_day_from_now})
    |> Pantry.Repo.insert!()
    |> after_insert_password_reset(volunteer)
  end

  defp after_insert_password_reset(reset, volunteer) do
    volunteer
    |> Pantry.Emails.Email.reset_password_email(reset)
    |> Pantry.Emails.Mailer.deliver_now()

    {:ok, reset}
  end

  def reset_password(%PasswordReset{} = reset, params) do
    reset.volunteer
    |> PasswordReset.reset_password_changeset(params)
    |> Pantry.Repo.update()
  end

  def get_password_reset(id) do
    now = NaiveDateTime.utc_now()

    query =
      from(pr in PasswordReset,
        where: pr.id == ^id and pr.expires_at > ^now
      )

    case Pantry.Repo.one(query) do
      nil -> {:error, "Password reset not found"}
      reset -> {:ok, Pantry.Repo.preload(reset, :volunteer)}
    end
  end
end
