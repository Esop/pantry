# Heroku Deployment
herokuapp_name = glacial-tundra-54542
heroku_url = https://glacial-tundra-54542.herokuapp.com



# Password Reset

## Routes I need
get "/password/new", PasswordController, :show
post "/password/new", PasswordController, :update

get "/password/reset", PasswordResetController, :show
post "/password/reset", PasswordResetController, :create


get "/email/verify", EmailVerificationController, :verify
get "/email/verification", EmailVerificationController, :show
post "/email/verification", EmailVerificationController, :create

## Modules I need
PasswordReset
The main responsibility of this module is to
change the password of the volunteers.
This module contains the schema and two functions

## Controllers I need
PasswordResetController
PasswordController
EmailVerificationController

## Templates I need
password_changed.html.eex
password_reset_request.html.eex


## View modules I need
password_reset_view.ex
password_view.ex



password_reset.ex
password_controller.ex
password_reset_controller.ex
password_controller.ex
password
password_reset
password
./lib/hexpm/web/templates/dashboard/password:
password_changed.html.eex
password_reset_request.html.eex
./lib/hexpm/web/templates/password:
./lib/hexpm/web/templates/password_reset:
password_reset_view.ex
password_view.ex
password_view.ex
20180609210018_add_password_resets.exs
change_password.exs
password_controller_test.exs
password_reset_controller_test.exs
password_controller_test.exs



## Password Reset Flow

PasswordResetController.show -> PasswordResetController.create -> Users.password_reset_init ->
