defmodule Pantry.AccountsTest do
  use Pantry.DataCase

  alias Pantry.Accounts

  describe "clients" do
    alias Pantry.Accounts.Client

    @valid_attrs %{address: "some address", city: "some city", county: "some county", ethnicity: "some ethnicity", first_name: "some first_name", last_name: "some last_name", last_visit: ~N[2010-04-17 14:00:00.000000], state: "some state", telephone: "some telephone", zip_code: "some zip_code"}
    @update_attrs %{address: "some updated address", city: "some updated city", county: "some updated county", ethnicity: "some updated ethnicity", first_name: "some updated first_name", last_name: "some updated last_name", last_visit: ~N[2011-05-18 15:01:01.000000], state: "some updated state", telephone: "some updated telephone", zip_code: "some updated zip_code"}
    @invalid_attrs %{address: nil, city: nil, county: nil, ethnicity: nil, first_name: nil, last_name: nil, last_visit: nil, state: nil, telephone: nil, zip_code: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
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
      assert {:ok, %Client{} = client} = Accounts.create_client(@valid_attrs)
      assert client.address == "some address"
      assert client.city == "some city"
      assert client.county == "some county"
      assert client.ethnicity == "some ethnicity"
      assert client.first_name == "some first_name"
      assert client.last_name == "some last_name"
      assert client.last_visit == ~N[2010-04-17 14:00:00.000000]
      assert client.state == "some state"
      assert client.telephone == "some telephone"
      assert client.zip_code == "some zip_code"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Accounts.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.address == "some updated address"
      assert client.city == "some updated city"
      assert client.county == "some updated county"
      assert client.ethnicity == "some updated ethnicity"
      assert client.first_name == "some updated first_name"
      assert client.last_name == "some updated last_name"
      assert client.last_visit == ~N[2011-05-18 15:01:01.000000]
      assert client.state == "some updated state"
      assert client.telephone == "some updated telephone"
      assert client.zip_code == "some updated zip_code"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_client(client, @invalid_attrs)
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

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password_hash: nil}

    def volunteer_fixture(attrs \\ %{}) do
      {:ok, volunteer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_volunteer()

      volunteer
    end

    test "list_volunteers/0 returns all volunteers" do
      volunteer = volunteer_fixture()
      assert Accounts.list_volunteers() == [volunteer]
    end

    test "get_volunteer!/1 returns the volunteer with given id" do
      volunteer = volunteer_fixture()
      assert Accounts.get_volunteer!(volunteer.id) == volunteer
    end

    test "create_volunteer/1 with valid data creates a volunteer" do
      assert {:ok, %Volunteer{} = volunteer} = Accounts.create_volunteer(@valid_attrs)
      assert volunteer.email == "some email"
      assert volunteer.first_name == "some first_name"
      assert volunteer.last_name == "some last_name"
      assert volunteer.password_hash == "some password_hash"
    end

    test "create_volunteer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_volunteer(@invalid_attrs)
    end

    test "update_volunteer/2 with valid data updates the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, volunteer} = Accounts.update_volunteer(volunteer, @update_attrs)
      assert %Volunteer{} = volunteer
      assert volunteer.email == "some updated email"
      assert volunteer.first_name == "some updated first_name"
      assert volunteer.last_name == "some updated last_name"
      assert volunteer.password_hash == "some updated password_hash"
    end

    test "update_volunteer/2 with invalid data returns error changeset" do
      volunteer = volunteer_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_volunteer(volunteer, @invalid_attrs)
      assert volunteer == Accounts.get_volunteer!(volunteer.id)
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
