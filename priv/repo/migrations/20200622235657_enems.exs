defmodule Backend.Repo.Migrations.Enems do
  use Ecto.Migration

  def change do
    add :year, :string
    add :mean, :integer
    add :questionnaire_id, references(:questionnaires)
  end
end
