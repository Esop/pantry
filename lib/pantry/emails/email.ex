defmodule Pantry.Emails.Email do
  import Bamboo.Email

  def reset_password_email(email) do
    new_email(
      to: "#{email}",
      from: "Russell Baker <russell@pantry.russellbaker.me>",
      subject: "password reset",
      html_body: "<strong>pleas click the link to reset your password</strong>",
      text_body: "here is your password reset"
    )
  end
end
