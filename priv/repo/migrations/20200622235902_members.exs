defmodule Backend.Repo.Migrations.Members do
  use Ecto.Migration

  def change do
    create table("members") do
      add :name, :string
      add :age, :string
      add :relationship, :string
      add :civil_status, :string
      add :scholarity, :string
      add :profession, :string
      add :income, :integer
      add :family_id, references(:families)

      timestamps()
    end
  end
end
