defmodule Backend.Repo.Migrations.Questionnaires do
  use Ecto.Migration

  def change do
    create table("questionnaires") do
      add :training, :string
      add :is_teacher, :boolean
      add :is_linked, :boolean
      timestamps()
    end
  end
end
