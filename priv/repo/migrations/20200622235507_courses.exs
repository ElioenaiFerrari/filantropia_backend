defmodule Backend.Repo.Migrations.Courses do
  use Ecto.Migration

  def change do
    create table("courses") do
      add :course, :string
      add :candidate_id, references(:candidates)

      timestamps()
    end
  end
end
