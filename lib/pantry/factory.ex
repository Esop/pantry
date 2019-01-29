defmodule Pantry.Factory do
  use ExMachina.Ecto, repo: Pantry.Repo

  def volunteer_factory do
    %Pantry.Accounts.Volunteer{
      email: Faker.Internet.email(),
      first_name: Faker.Name.first_name(),
      last_name: Faker.Name.last_name(),
      password_hash: Comeonin.Bcrypt.hashpwsalt("mydogs33"),
      password: "mydogs33",
      admin: true
    }
  end

  def client_factory do
    %Pantry.Accounts.Client{
      address: Faker.Address.street_address(),
      city: Faker.Address.city(),
      county: sequence(:county, ["Duval", "Dade", "Leon", "Madison"]),
      description_of_need: "Needs food and clothes",
      ethnicity: sequence(:ethnicity, ["African American", "Asian", "White", "Other"]),
      first_name: Faker.Name.first_name(),
      last_name: Faker.Name.last_name(),
      notes: "Some random notes",
      state: sequence(:state, ["Florida", "Georgia", "Alabama"]),
      telephone: Faker.Phone.EnUs.phone(),
      zipcode: Faker.Address.zip_code(),
      assistance: [build(:assistance)],
      certification: [build(:certification)],
      household: build(:household),
      produce_distributions: [build(:produce_distribution)]
    }
  end

  def assistance_factory do
    date = Date.utc_today()

    %Pantry.Forms.Assistance{
      next_service_date: date,
      received_food: true,
      received_voucher: true
    }
  end

  def certification_factory do
    %Pantry.Forms.Certification{
      income_eligibility: sequence(:income_eligibility, ["true", "false"]),
      medicaid: sequence(:income_eligibility, ["true", "false"]),
      supplemental_nutrition_assistance: sequence(:income_eligibility, ["true", "false"]),
      supplemental_security_income: sequence(:income_eligibility, ["true", "false"]),
      temporary_assistance_to_needy_families: sequence(:income_eligibility, ["true", "false"])
    }
  end

  def household_factory do
    %Pantry.Residence.Household{
      total_members: 5
    }
  end

  def produce_distribution_factory do
    %Pantry.Forms.ProduceDistribution{
      food_stamps: sequence(:foodstamps, ["true", "false"]),
      income_eligibility: "true",
      public_housing: "true",
      signature: "she signed",
      ssi_medicaid: "true",
      temporary_assistance: "true"
    }
  end
end
