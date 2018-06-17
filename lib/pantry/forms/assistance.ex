defmodule Pantry.Forms.Assistance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assistance" do
    field(:next_service_date, :date)
    field(:received_food, :boolean, default: false)
    field(:received_voucher, :boolean, default: false)
    field(:client_id, :id)

    timestamps()
  end

  @doc false
  def changeset(assistance, attrs) do
    assistance
    |> cast(attrs, [:received_voucher, :received_food, :next_service_date, :client_id])
    |> validate_required([:received_voucher, :received_food, :next_service_date, :client_id])
  end
end
