defmodule Backend.VehicleModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.VehicleSchema

  def index(VehicleSchema), do: Repo.all(VehicleSchema)

  def show(id), do: Repo.get!(VehicleSchema, id)

  def create(attrs \\ %{}) do
    %VehicleSchema{}
    |> VehicleSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%VehicleSchema{} = vehicle, attrs) do
    vehicle
    |> VehicleSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%VehicleSchema{} = vehicle), do: Repo.delete!(vehicle)
end
