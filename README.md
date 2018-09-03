mix phx.gen.html Forms ProduceDistribution produce_distributions first_name last_name income_eligibility:boolean food_stamps:boolean temporary_assistance ssi_medicaid public_housing signature client_id:references:clients


mix phx.gen.html Forms Certification certifications first_name last_name address county family_size:integer income_eligibility:boolean supplemental_nutrition_assistance:boolean temporary_assistance_to_needy_families:boolean supplemental_security_income:boolean medicaid:boolean clients_id:references:clients



password_reset.ex
password_reset_controller.ex
password_controller.ex
password
password_changed.html.eex
password_reset_request.html.eex
password_reset_view.ex
password_view.ex
20180609210018_add_password_resets.exs
change_password.exs
password_controller_test.exs
password_reset_controller_testiepple.finder AppleShowAllFiles YES; killall Finder;
xs




curl -s --user 'api:34deca9bd99c802f48ff517c0d1ec3fc-c1fe131e-a9277f60' \
    https://api.mailgun.net/v3/pantry.russellbaker.me/messages \
    -F from='Excited User <mailgun@pantry.russellbaker.me>' \
    -F to=pantry.russellbaker.me \
    -F to=rbakerjax@gmail.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomeness!'
