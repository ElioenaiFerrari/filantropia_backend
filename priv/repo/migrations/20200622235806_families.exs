defmodule Backend.Repo.Migrations.Families do
  use Ecto.Migration

  def change do
    create table(:families) do
      add :housing_type, :string
      add :candidate_id, references(:candidates)

      timestamps()
    end
  end
end
