defmodule Backend.Repo.Migrations.Enems do
  use Ecto.Migration

  def change do
    create table("enems") do
      add :year, :string
      add :mean, :integer
      add :questionnaire_id, references(:questionnaires)

      timestamps()
    end
  end
end
