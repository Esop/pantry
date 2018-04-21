defmodule Pantry.AccountsTest do
  use Pantry.DataCase

  alias Pantry.Accounts

  describe "clients" do
    alias Pantry.Accounts.Client

   def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(valid_client_creation_params())
        |> Accounts.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Accounts.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Accounts.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Accounts.create_client(valid_client_creation_params())
      assert client.address == "2056 Sessions lane"
      assert client.city == "Tallahasse"
      assert client.county == "Leon"
      assert client.ethnicity == "Black"
      assert client.first_name == "Nicki"
      assert client.last_name == "Bonobo"
      assert client.last_visit == ~N[2010-04-17 14:00:00.000000]
      assert client.state == "Florida"
      assert client.telephone == "9049990000"
      assert client.zip_code == "32207"
    end

    test "create_client/1 with invalid data returns error changeset" do
      invalid_client_attrs = Map.put(valid_client_creation_params(), :first_name, "")
      assert {:error, %Ecto.Changeset{}} = Accounts.create_client(invalid_client_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      updated_params = Map.put(valid_client_creation_params(), :county, "Duval")
      assert {:ok, client} = Accounts.update_client(client, updated_params)
      assert %Client{} = client
      assert client.county == "Duval"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_client(client, %{first_name: nil})
      assert client == Accounts.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Accounts.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Accounts.change_client(client)
    end
  end

  describe "volunteers" do
    alias Pantry.Accounts.Volunteer

    def volunteer_fixture(attrs \\ %{}) do
      {:ok, volunteer} =
        attrs
        |> Enum.into(valid_volunteer_signup_params())
        |> Accounts.create_volunteer()

      volunteer
    end

    # # FIXME: Find a way to test this
    # test "list_volunteers/0 returns all volunteers" do
    #   # volunteer = volunteer_fixture()
    #   volunteer = Map.put(volunteer_fixture, :password, "$secre$")
    #   assert Accounts.list_volunteers() == [volunteer]
    # end

    # # FIXME: Find a way to test this
    # test "get_volunteer!/1 returns the volunteer with given id" do
    #   volunteer = volunteer_fixture()
    #   assert Accounts.get_volunteer!(volunteer.id) == volunteer
    # end

    test "create_volunteer/1 with valid data creates a volunteer" do
      assert {:ok, %Volunteer{} = volunteer} =
               Accounts.create_volunteer(valid_volunteer_signup_params())

      # assert volunteer.email == "some email"
      # assert volunteer.first_name == "some first_name"
      # assert volunteer.last_name == "some last_name"
      # assert volunteer.password_hash == "some password_hash"
    end

    test "create_volunteer/1 with invalid data returns error changeset" do
      invalid_volunteer_params = Map.put(valid_volunteer_signup_params(), :password, nil)
      assert {:error, %Ecto.Changeset{}} = Accounts.create_volunteer(invalid_volunteer_params)
    end

    test "update_volunteer/2 with valid data updates the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, volunteer} = Accounts.update_volunteer(volunteer, %{first_name: "Russell"})
      assert %Volunteer{} = volunteer
      assert volunteer.first_name == "Russell"
    end

    test "update_volunteer/2 with invalid data returns error changeset" do
      volunteer = volunteer_fixture()

      assert {:error, %Ecto.Changeset{}} = Accounts.update_volunteer(volunteer, %{password: nil})

      # assert volunteer == Accounts.get_volunteer!(volunteer.id)
    end

    test "delete_volunteer/1 deletes the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, %Volunteer{}} = Accounts.delete_volunteer(volunteer)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_volunteer!(volunteer.id) end
    end

    test "change_volunteer/1 returns a volunteer changeset" do
      volunteer = volunteer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_volunteer(volunteer)
    end
  end
end
