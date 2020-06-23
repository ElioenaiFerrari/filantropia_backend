defmodule Backend.Repo.Migrations.Contacts do
  use Ecto.Migration

  def change do
    create table("contacts") do
      add :cellphone, :string
      add :phone, :string
      add :email, :string
      add :address, :string
      add :district, :string
      add :number, :string
      add :adjunct, :string
      add :zip_code, :string
      add :state, :string
      add :candidate_id, references(:candidates)

      timestamps()
    end
  end
end
