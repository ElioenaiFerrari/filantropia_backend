defmodule Backend.VehicleSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.FamilySchema

  schema "vehicles" do
    field :model, :string
    field :year, :string
    field :utility, :string
    belongs_to :family, FamilySchema

    timestamps(type: :utc_datetime)
  end

  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:model, :year, :utility, :family_id])
    |> validate_required([:model, :year, :utility, :family_id])
    |> validate_inclusion(:utility, ["Pessoal", "Comercial"])
  end
end
