defmodule BackendWeb.FamilyController do
  use BackendWeb, :controller

  alias Backend.FamilySchema
  alias Backend.FamilyModel

  def index(conn, _params) do
    families = FamilyModel.index(FamilySchema)
    render(conn, "index.json", families: families)
  end

  def show(conn, %{"id" => id}) do
    family = FamilyModel.show(id)
    render(conn, "show.json", family: family)
  end

  def update(conn, %{"id" => id, "family" => attrs}) do
    family = FamilyModel.show(id)

    with {
           :ok,
           family
         } <- FamilyModel.update(family, attrs) do
      render(conn, "show.json", family: family)
    end
  end

  def delete(conn, %{"id" => id}) do
    family = FamilyModel.show(id)

    with {
           :ok,
           %FamilySchema{}
         } <- FamilyModel.delete(family) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"family" => attrs}) do
    with {
           :ok,
           attrs
         } <- FamilyModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", family: attrs)
    end
  end
end
