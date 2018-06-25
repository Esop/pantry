defmodule Pantry.FormsTest do
  use Pantry.DataCase

  alias Pantry.Forms

  describe "vouchers" do
    alias Pantry.Forms.Voucher

    @valid_attrs %{next_service_date: ~D[2010-04-17], received_food: true, received_money: true, voucher_amount: "some voucher_amount"}
    @update_attrs %{next_service_date: ~D[2011-05-18], received_food: false, received_money: false, voucher_amount: "some updated voucher_amount"}
    @invalid_attrs %{next_service_date: nil, received_food: nil, received_money: nil, voucher_amount: nil}

    def voucher_fixture(attrs \\ %{}) do
      {:ok, voucher} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forms.create_voucher()

      voucher
    end

    test "list_vouchers/0 returns all vouchers" do
      voucher = voucher_fixture()
      assert Forms.list_vouchers() == [voucher]
    end

    test "get_voucher!/1 returns the voucher with given id" do
      voucher = voucher_fixture()
      assert Forms.get_voucher!(voucher.id) == voucher
    end

    test "create_voucher/1 with valid data creates a voucher" do
      assert {:ok, %Voucher{} = voucher} = Forms.create_voucher(@valid_attrs)
      assert voucher.next_service_date == ~D[2010-04-17]
      assert voucher.received_food == true
      assert voucher.received_money == true
      assert voucher.voucher_amount == "some voucher_amount"
    end

    test "create_voucher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_voucher(@invalid_attrs)
    end

    test "update_voucher/2 with valid data updates the voucher" do
      voucher = voucher_fixture()
      assert {:ok, voucher} = Forms.update_voucher(voucher, @update_attrs)
      assert %Voucher{} = voucher
      assert voucher.next_service_date == ~D[2011-05-18]
      assert voucher.received_food == false
      assert voucher.received_money == false
      assert voucher.voucher_amount == "some updated voucher_amount"
    end

    test "update_voucher/2 with invalid data returns error changeset" do
      voucher = voucher_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_voucher(voucher, @invalid_attrs)
      assert voucher == Forms.get_voucher!(voucher.id)
    end

    test "delete_voucher/1 deletes the voucher" do
      voucher = voucher_fixture()
      assert {:ok, %Voucher{}} = Forms.delete_voucher(voucher)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_voucher!(voucher.id) end
    end

    test "change_voucher/1 returns a voucher changeset" do
      voucher = voucher_fixture()
      assert %Ecto.Changeset{} = Forms.change_voucher(voucher)
    end
  end

  describe "assistance" do
    alias Pantry.Forms.Assistance

    @valid_attrs %{next_service: ~D[2010-04-17], received_food: true, received_voucher: true}
    @update_attrs %{next_service: ~D[2011-05-18], received_food: false, received_voucher: false}
    @invalid_attrs %{next_service: nil, received_food: nil, received_voucher: nil}

    def assistance_fixture(attrs \\ %{}) do
      {:ok, assistance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forms.create_assistance()

      assistance
    end

    test "list_assistance/0 returns all assistance" do
      assistance = assistance_fixture()
      assert Forms.list_assistance() == [assistance]
    end

    test "get_assistance!/1 returns the assistance with given id" do
      assistance = assistance_fixture()
      assert Forms.get_assistance!(assistance.id) == assistance
    end

    test "create_assistance/1 with valid data creates a assistance" do
      assert {:ok, %Assistance{} = assistance} = Forms.create_assistance(@valid_attrs)
      assert assistance.next_service == ~D[2010-04-17]
      assert assistance.received_food == true
      assert assistance.received_voucher == true
    end

    test "create_assistance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_assistance(@invalid_attrs)
    end

    test "update_assistance/2 with valid data updates the assistance" do
      assistance = assistance_fixture()
      assert {:ok, assistance} = Forms.update_assistance(assistance, @update_attrs)
      assert %Assistance{} = assistance
      assert assistance.next_service == ~D[2011-05-18]
      assert assistance.received_food == false
      assert assistance.received_voucher == false
    end

    test "update_assistance/2 with invalid data returns error changeset" do
      assistance = assistance_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_assistance(assistance, @invalid_attrs)
      assert assistance == Forms.get_assistance!(assistance.id)
    end

    test "delete_assistance/1 deletes the assistance" do
      assistance = assistance_fixture()
      assert {:ok, %Assistance{}} = Forms.delete_assistance(assistance)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_assistance!(assistance.id) end
    end

    test "change_assistance/1 returns a assistance changeset" do
      assistance = assistance_fixture()
      assert %Ecto.Changeset{} = Forms.change_assistance(assistance)
    end
  end

  describe "produce_distributions" do
    alias Pantry.Forms.ProduceDistribution

    @valid_attrs %{first_name: "some first_name", food_stamps: true, income_eligibility: true, last_name: "some last_name", public_housing: "some public_housing", signature: "some signature", ssi_medicaid: "some ssi_medicaid", temporary_assistance: "some temporary_assistance"}
    @update_attrs %{first_name: "some updated first_name", food_stamps: false, income_eligibility: false, last_name: "some updated last_name", public_housing: "some updated public_housing", signature: "some updated signature", ssi_medicaid: "some updated ssi_medicaid", temporary_assistance: "some updated temporary_assistance"}
    @invalid_attrs %{first_name: nil, food_stamps: nil, income_eligibility: nil, last_name: nil, public_housing: nil, signature: nil, ssi_medicaid: nil, temporary_assistance: nil}

    def produce_distribution_fixture(attrs \\ %{}) do
      {:ok, produce_distribution} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forms.create_produce_distribution()

      produce_distribution
    end

    test "list_produce_distributions/0 returns all produce_distributions" do
      produce_distribution = produce_distribution_fixture()
      assert Forms.list_produce_distributions() == [produce_distribution]
    end

    test "get_produce_distribution!/1 returns the produce_distribution with given id" do
      produce_distribution = produce_distribution_fixture()
      assert Forms.get_produce_distribution!(produce_distribution.id) == produce_distribution
    end

    test "create_produce_distribution/1 with valid data creates a produce_distribution" do
      assert {:ok, %ProduceDistribution{} = produce_distribution} = Forms.create_produce_distribution(@valid_attrs)
      assert produce_distribution.first_name == "some first_name"
      assert produce_distribution.food_stamps == true
      assert produce_distribution.income_eligibility == true
      assert produce_distribution.last_name == "some last_name"
      assert produce_distribution.public_housing == "some public_housing"
      assert produce_distribution.signature == "some signature"
      assert produce_distribution.ssi_medicaid == "some ssi_medicaid"
      assert produce_distribution.temporary_assistance == "some temporary_assistance"
    end

    test "create_produce_distribution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_produce_distribution(@invalid_attrs)
    end

    test "update_produce_distribution/2 with valid data updates the produce_distribution" do
      produce_distribution = produce_distribution_fixture()
      assert {:ok, produce_distribution} = Forms.update_produce_distribution(produce_distribution, @update_attrs)
      assert %ProduceDistribution{} = produce_distribution
      assert produce_distribution.first_name == "some updated first_name"
      assert produce_distribution.food_stamps == false
      assert produce_distribution.income_eligibility == false
      assert produce_distribution.last_name == "some updated last_name"
      assert produce_distribution.public_housing == "some updated public_housing"
      assert produce_distribution.signature == "some updated signature"
      assert produce_distribution.ssi_medicaid == "some updated ssi_medicaid"
      assert produce_distribution.temporary_assistance == "some updated temporary_assistance"
    end

    test "update_produce_distribution/2 with invalid data returns error changeset" do
      produce_distribution = produce_distribution_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_produce_distribution(produce_distribution, @invalid_attrs)
      assert produce_distribution == Forms.get_produce_distribution!(produce_distribution.id)
    end

    test "delete_produce_distribution/1 deletes the produce_distribution" do
      produce_distribution = produce_distribution_fixture()
      assert {:ok, %ProduceDistribution{}} = Forms.delete_produce_distribution(produce_distribution)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_produce_distribution!(produce_distribution.id) end
    end

    test "change_produce_distribution/1 returns a produce_distribution changeset" do
      produce_distribution = produce_distribution_fixture()
      assert %Ecto.Changeset{} = Forms.change_produce_distribution(produce_distribution)
    end
  end
end
