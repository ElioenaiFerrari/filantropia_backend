defmodule Backend.Repo.Migrations.Candidates do
  use Ecto.Migration

  def change do
    create table(:candidates) do
      add :name, :string
      add :sex, :string
      add :birthday, :string

      timestamps()
    end
  end
end
