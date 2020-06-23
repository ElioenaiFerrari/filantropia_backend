defmodule Backend.Repo.Migrations.Candidates do
  use Ecto.Migration

  def change do
    add :name, :string
    add :sex, :string
    add :birthday, :utc_datetime
    add :contact_id, references(:contacts)
  end
end
