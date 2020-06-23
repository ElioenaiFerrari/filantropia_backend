defmodule Backend.Repo.Migrations.Questionnaires do
  use Ecto.Migration

  def change do
    add :training, :string
    add :is_teacher, :boolean
    add :is_linked, :boolean
    add :enem_id, references(:enems)
  end
end
