defmodule Backend.Repo.Migrations.Vehicles do
  use Ecto.Migration

  def change do
    add :model, :string
    add :year, :string
    add :utility, :string
    add :family_id, references(:families)
  end
end
