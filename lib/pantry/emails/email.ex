defmodule Pantry.Emails.Email do
  @moduledoc """
  Email template for forgotten password
  """
  import Bamboo.Email
  use Bamboo.Phoenix, view: PantryWeb.EmailView

  def reset_password_email(volunteer, reset) do
    new_email()
    |> to("#{volunteer.email}")
    |> from("Community Cares <russell@pantry.russellbaker.me>")
    |> assign(:reset_key, reset)
    |> subject("Reset Lost Password")
    |> render("password_reset_request.html")
  end
end
