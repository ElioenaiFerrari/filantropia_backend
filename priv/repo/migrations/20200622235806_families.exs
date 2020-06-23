defmodule Backend.Repo.Migrations.Families do
  use Ecto.Migration

  def change do
    add :housing_type, :string
    add :vehicle_id, references(:vehicles)
    add :member_id, references(:members)
  end
end
