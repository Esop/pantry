defmodule Pantry.Repo.Migrations.DropVouchersTable do
  use Ecto.Migration

  def change do
    drop(table("vouchers"))
  end
end
