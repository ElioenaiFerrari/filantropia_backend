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
end
