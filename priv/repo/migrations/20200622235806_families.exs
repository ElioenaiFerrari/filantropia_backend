defmodule Backend.Repo.Migrations.Families do
  use Ecto.Migration

  def change do
    create table("families") do
      add :housing_type, :string
      timestamps()
    end
  end
end
