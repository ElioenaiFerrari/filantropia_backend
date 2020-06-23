defmodule BackendWeb.VehicleController do
  use BackendWeb, :controller

  alias Backend.VehicleSchema
  alias Backend.VehicleModel

  def index(conn, _params) do
    vehicles = VehicleModel.index(VehicleSchema)
    render(conn, "index.json", vehicles: vehicles)
  end

  def show(conn, %{"id" => id}) do
    vehicle = VehicleModel.show(id)
    render(conn, "show.json", vehicle: vehicle)
  end

  def update(conn, %{"id" => id, "vehicle" => attrs}) do
    vehicle = VehicleModel.show(id)

    with {
           :ok,
           %VehicleSchema{} = vehicle
         } <- VehicleModel.update(vehicle, attrs) do
      render(conn, "show.json", vehicle: vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = VehicleModel.show(id)

    with {
           :ok,
           %VehicleSchema{}
         } <- VehicleModel.delete(vehicle) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"vehicle" => attrs}) do
    with {
           :ok,
           %VehicleSchema{} = attrs
         } <- VehicleModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", vehicle: attrs)
    end
  end
end
