defmodule Pantry.Accounts.Dashboard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dashboards" do
    belongs_to(:client, Pantry.Accounts.Client)
    timestamps()
  end

  @doc false
  def changeset(dashboard, attrs) do
    dashboard
    |> cast(attrs, [])
    |> validate_required([])
  end
end
