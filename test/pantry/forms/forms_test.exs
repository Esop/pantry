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
end
