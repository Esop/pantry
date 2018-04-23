defmodule Pantry.TestHelpers do
  @moduledoc """
    Miscellaneous helper functions for tests.
  """

  alias Pantry.Repo

  # ==================
  #      Volunteer
  # ==================
  def valid_volunteer_signup_params do
    salt = random_string()

    %{
      first_name: "Velvet",
      last_name: "Hunter",
      email: "user#{salt}@mail.com",
      password: "$ecret$",
      password_confirmation: "$ecret$"
    }
  end

  def valid_volunteer_update_params do
    salt = random_string()

    %{
      first_name: "Some updated first_name",
      last_name: "Some updated last_name",
      email: "some updated email",
      password: "some updated password",
      password_confirmation: "some updated password"
    }
  end

  defp random_string do
    8
    |> :crypto.strong_rand_bytes()
    |> Base.encode16()
    |> String.downcase()
  end

  # ===========================
  #         Client
  # ===========================
  def valid_client_creation_params do
    salt = random_string()

    %{
      first_name: "Nicki",
      last_name: "Bonobo",
      address: "2056 Sessions lane",
      city: "Tallahasse",
      county: "Leon",
      ethnicity: "Black",
      last_visit: ~N[2010-04-17 14:00:00.000000],
      state: "Florida",
      telephone: "9049990000",
      zip_code: "32207"
    }

  end
end
