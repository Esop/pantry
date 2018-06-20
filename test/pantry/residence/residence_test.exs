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
end
