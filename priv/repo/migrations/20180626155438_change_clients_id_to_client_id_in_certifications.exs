defmodule Pantry.Repo.Migrations.ChangeClientsIdToClientIdInCertifications do
  use Ecto.Migration

  def change do
    alter table(:certifications) do
      remove(:clients_id)
      add(:client_id, references(:clients, on_delete: :nothing))
    end
  end
end
