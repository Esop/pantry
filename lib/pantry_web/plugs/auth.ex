defmodule PantryWeb.Auth do
  @moduledoc """
   Contains functions that help log the user in
  and adds them to a session
  """

  import Plug.Conn
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias Pantry.Accounts.Volunteer
  alias Pantry.Accounts

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    # I think that this line is probably the wrong way
    # to retrieve the user. I probably should be going through
    # the Accounts context.
    user = user_id && repo.get(Volunteer, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def login_by_email_and_pass(conn, email, given_pass) do
    {:ok, user} = Accounts.get_vol_by_email(email)

    cond do
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, login(conn, user)}

      user ->
        {:error, :unauthorized, conn}

      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def gen_key() do
    :crypto.strong_rand_bytes(16)
    |> Base.encode16(case: :lower)
  end
end
