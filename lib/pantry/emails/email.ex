defmodule Pantry.Emails.Email do
  import Bamboo.Email

  def reset_password_email do
    new_email(
      to: "rbakerjax@gmail.com",
      from: "pantry.russellbaker.me",
      subject: "you forgot it",
      html_body: "<strong>Thanks for forgetting!</strong>",
      text_body: "here is your password reset"
    )
  end
end
