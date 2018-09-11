defmodule Pantry.Emails.Email do
  import Bamboo.Email
  use Bamboo.Phoenix, view: PantryWeb.EmailView

  def reset_password_email(email, reset) do
    new_email()
    |> to("#{email}")
    |> from("Russell Baker <russell@pantry.russellbaker.me>")
    |> subject("Reset Lost Password")
    |> assign(:key, reset.key)
    |> render("password_reset_request.html")
  end
end
