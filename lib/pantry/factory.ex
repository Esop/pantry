defmodule Pantry.Factory do
  use ExMachina.Ecto, repo: Pantry.Repo

  def client_factory do
    %Pantry.Accounts.Client{
      address: sequence(:address, ["2045 Davis Lane", "2222 My Road"]),
      city: sequence(:city, ["Tallahasse", "Jacksonville", "Madison", "Gilchrest"]),
      county: sequence(:county, ["Duval", "Dade", "Leon", "Madison"]),
      description_of_need: "Needs food and clothes",
      ethnicity: sequence(:ethnicity, ["African American", "Asian", "White", "Other"]),
      first_name: sequence("Mary"),
      last_name: sequence("Thomas"),
      notes: "Some random notes",
      state: sequence(:state, ["Florida", "Georgia", "Alabama"]),
      telephone: sequence(:telephone, ["904-728-6000", "805-911-2312"]),
      zipcode: sequence(:zipcode, ["32207", "32209"]),
      assistance: [build(:assistance)],
      certification: [build(:certification)],
      household: [build(:household)],
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
      family_size: sequence(:family_size, &"1#{&1}"),
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
      last_name: "Hartl",
      public_housing: "true",
      signature: "she signed",
      ssi_medicaid: "true",
      temporary_assistance: "true"
    }
  end
end
