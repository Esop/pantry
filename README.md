# Pantry


date
volunteer
first name of client
last name of client
address
county
city
state
zip code
telephone
referrer
ethnicity
Black/African American
White
Hispanic/Latino
Asian
American Indian/Alaskan Native
Native Hawaiian/Other Pacific Islander
Other/Multi Racial
authorized person to pick up food
total number of people living in the household
total number of people in each of these age groups (0-5 6-12 13-18 19-25 26-39 40-54 55+)
brief description of need
notes or comments (e.g. needs help with utilities Referred to 211 01/01/2014)


mix ecto.gen.html Accounts User users first_name last_name address county city state zip_code telephone ethnicity


## Volunteer
first_name
last_name
email


## Associations
client has_many volunteers
volunteer has_many clients
clients have_many forms
forms have_one client


## Forms
Sign in
Fresh Produce Distribution Log Sheet
Voucher
Certification of eligibility
Community Cares Outreach Voucher Family to Family Thrift Store

### Fresh Produce Distribution Log Sheet
name
address
HH is household income
income eligibility
signature

### Voucher
date_received_food
date_received_voucher
voucher_amount



rix phx.gen.html Forms form forms client_id:references:clients received_money:boolean received_food:boolean voucher_amount next_service_date:date
