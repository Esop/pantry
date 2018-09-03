defmodule Pantry.Emails.Email do
  import Bamboo.Email

  def reset_password_email do
    new_email(
      to: "rbakerjax@gmail.com",
      from: "pantry.russellbaker.me",
      subject: "password reset",
      html_body: "<strong>pleas click the link to reset your password</strong>",
      text_body: "here is your password reset"
    )
  end
end
