# Heroku Deployment
herokuapp_name = glacial-tundra-54542
heroku_url = https://glacial-tundra-54542.herokuapp.com



# Password Resets

get "/password/new", PasswordController, :show
post "/password/new", PasswordController, :update

get "/password/reset", PasswordResetController, :show
post "/password/reset", PasswordResetController, :create
