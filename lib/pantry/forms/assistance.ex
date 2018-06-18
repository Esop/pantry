defmodule Pantry.Forms.Assistance do
  use Ecto.Schema
  import Ecto.Changeset
  import PantryWeb.AssistanceView, only: [add_30_days: 0]

  schema "assistance" do
    field(:next_service_date, :date)
    field(:received_food, :boolean, default: false)
    field(:received_voucher, :boolean, default: false)
    belongs_to(:client, Pantry.Accounts.Client)

    timestamps()
  end

  @doc false
  def changeset(assistance, attrs) do
    assistance
    |> cast(attrs, [:received_voucher, :received_food, :client_id])
    |> validate_required([:received_voucher, :received_food, :client_id])
    |> set_next_service_date()
  end

  def set_next_service_date(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :next_service_date, add_30_days())

      _ ->
        changeset
    end
  end
end
