defmodule Backend.Repo.Migrations.Courses do
  use Ecto.Migration

  def change do
    add :courses, {:array, :string}
    add :candidate_id, references(:candidates)
  end
end
