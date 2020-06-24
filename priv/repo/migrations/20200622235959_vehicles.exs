defmodule Backend.Repo.Migrations.Vehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :model, :string
      add :year, :string
      add :utility, :string
      add :family_id, references(:families)

      timestamps()
    end
  end
end
