defmodule Pantry.Forms.Voucher do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vouchers" do
    field :next_service_date, :date
    field :received_food, :boolean, default: true
    field :received_money, :boolean, default: false
    field :voucher_amount, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(voucher, attrs) do
    voucher
    |> cast(attrs, [:received_money, :received_food, :voucher_amount, :next_service_date])
    |> validate_required([:received_money, :received_food, :voucher_amount, :next_service_date])
  end
end
