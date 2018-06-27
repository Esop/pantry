defmodule Pantry.ResidenceTest do
  use Pantry.DataCase

  alias Pantry.Residence

  describe "residences" do
    alias Pantry.Residence.Household

    @valid_attrs %{city: "some city", county: "some county", state: "some state", street_address: "some street_address", total_members: 42, zip_code: "some zip_code"}
    @update_attrs %{city: "some updated city", county: "some updated county", state: "some updated state", street_address: "some updated street_address", total_members: 43, zip_code: "some updated zip_code"}
    @invalid_attrs %{city: nil, county: nil, state: nil, street_address: nil, total_members: nil, zip_code: nil}

    def household_fixture(attrs \\ %{}) do
      {:ok, household} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Residence.create_household()

      household
    end

    test "list_residences/0 returns all residences" do
      household = household_fixture()
      assert Residence.list_residences() == [household]
    end

    test "get_household!/1 returns the household with given id" do
      household = household_fixture()
      assert Residence.get_household!(household.id) == household
    end

    test "create_household/1 with valid data creates a household" do
      assert {:ok, %Household{} = household} = Residence.create_household(@valid_attrs)
      assert household.city == "some city"
      assert household.county == "some county"
      assert household.state == "some state"
      assert household.street_address == "some street_address"
      assert household.total_members == 42
      assert household.zip_code == "some zip_code"
    end

    test "create_household/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Residence.create_household(@invalid_attrs)
    end

    test "update_household/2 with valid data updates the household" do
      household = household_fixture()
      assert {:ok, household} = Residence.update_household(household, @update_attrs)
      assert %Household{} = household
      assert household.city == "some updated city"
      assert household.county == "some updated county"
      assert household.state == "some updated state"
      assert household.street_address == "some updated street_address"
      assert household.total_members == 43
      assert household.zip_code == "some updated zip_code"
    end

    test "update_household/2 with invalid data returns error changeset" do
      household = household_fixture()
      assert {:error, %Ecto.Changeset{}} = Residence.update_household(household, @invalid_attrs)
      assert household == Residence.get_household!(household.id)
    end

    test "delete_household/1 deletes the household" do
      household = household_fixture()
      assert {:ok, %Household{}} = Residence.delete_household(household)
      assert_raise Ecto.NoResultsError, fn -> Residence.get_household!(household.id) end
    end

    test "change_household/1 returns a household changeset" do
      household = household_fixture()
      assert %Ecto.Changeset{} = Residence.change_household(household)
    end
  end

  describe "agegroups" do
    alias Pantry.Residence.AgeGroup

    @valid_attrs %{fiftyfive_and_over: "some fiftyfive_and_over", fourty_fiftyfour: 42, nineteen_twentyfive: "some nineteen_twentyfive", six_twelve: 42, thirteen_eighteen: 42, twentysix_thirtynine: 42, zero_five: 42}
    @update_attrs %{fiftyfive_and_over: "some updated fiftyfive_and_over", fourty_fiftyfour: 43, nineteen_twentyfive: "some updated nineteen_twentyfive", six_twelve: 43, thirteen_eighteen: 43, twentysix_thirtynine: 43, zero_five: 43}
    @invalid_attrs %{fiftyfive_and_over: nil, fourty_fiftyfour: nil, nineteen_twentyfive: nil, six_twelve: nil, thirteen_eighteen: nil, twentysix_thirtynine: nil, zero_five: nil}

    def age_group_fixture(attrs \\ %{}) do
      {:ok, age_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Residence.create_age_group()

      age_group
    end

    test "list_agegroups/0 returns all agegroups" do
      age_group = age_group_fixture()
      assert Residence.list_agegroups() == [age_group]
    end

    test "get_age_group!/1 returns the age_group with given id" do
      age_group = age_group_fixture()
      assert Residence.get_age_group!(age_group.id) == age_group
    end

    test "create_age_group/1 with valid data creates a age_group" do
      assert {:ok, %AgeGroup{} = age_group} = Residence.create_age_group(@valid_attrs)
      assert age_group.fiftyfive_and_over == "some fiftyfive_and_over"
      assert age_group.fourty_fiftyfour == 42
      assert age_group.nineteen_twentyfive == "some nineteen_twentyfive"
      assert age_group.six_twelve == 42
      assert age_group.thirteen_eighteen == 42
      assert age_group.twentysix_thirtynine == 42
      assert age_group.zero_five == 42
    end

    test "create_age_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Residence.create_age_group(@invalid_attrs)
    end

    test "update_age_group/2 with valid data updates the age_group" do
      age_group = age_group_fixture()
      assert {:ok, age_group} = Residence.update_age_group(age_group, @update_attrs)
      assert %AgeGroup{} = age_group
      assert age_group.fiftyfive_and_over == "some updated fiftyfive_and_over"
      assert age_group.fourty_fiftyfour == 43
      assert age_group.nineteen_twentyfive == "some updated nineteen_twentyfive"
      assert age_group.six_twelve == 43
      assert age_group.thirteen_eighteen == 43
      assert age_group.twentysix_thirtynine == 43
      assert age_group.zero_five == 43
    end

    test "update_age_group/2 with invalid data returns error changeset" do
      age_group = age_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Residence.update_age_group(age_group, @invalid_attrs)
      assert age_group == Residence.get_age_group!(age_group.id)
    end

    test "delete_age_group/1 deletes the age_group" do
      age_group = age_group_fixture()
      assert {:ok, %AgeGroup{}} = Residence.delete_age_group(age_group)
      assert_raise Ecto.NoResultsError, fn -> Residence.get_age_group!(age_group.id) end
    end

    test "change_age_group/1 returns a age_group changeset" do
      age_group = age_group_fixture()
      assert %Ecto.Changeset{} = Residence.change_age_group(age_group)
    end
  end
end
