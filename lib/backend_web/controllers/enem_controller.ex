defmodule BackendWeb.EnemController do
  use BackendWeb, :controller

  alias Backend.EnemModel
  alias Backend.EnemSchema

  def index(conn, _param) do
    enems = EnemModel.index(EnemSchema)
    render(conn, "index.json", enems: enems)
  end

  def show(conn, %{"id" => id}) do
    enem = EnemModel.show(id)
    render(conn, "show.json", enem: enem)
  end

  def update(conn, %{"id" => id, "enem" => attrs}) do
    enem = EnemModel.show(id)

    with {
           :ok,
           %EnemSchema{} = enem
         } <- EnemModel.update(enem, attrs) do
      render(conn, "show.json", enem: enem)
    end
  end

  def delete(conn, %{"id" => id}) do
    enem = EnemModel.show(id)

    with {
           :ok,
           %EnemSchema{}
         } <- EnemModel.delete(enem) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"enem" => attrs}) do
    with {
           :ok,
           %EnemSchema{} = attrs
         } <- EnemModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", enem: attrs)
    end
  end
end
