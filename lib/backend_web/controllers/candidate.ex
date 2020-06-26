defmodule BackendWeb.CandidateController do
  use BackendWeb, :controller

  alias Backend.CandidateModel
  alias Backend.CandidateSchema

  def index(conn, _params) do
    candidates = CandidateModel.index(CandidateSchema)
    render(conn, "index.json", candidates: candidates)
  end

  def show(conn, %{"id" => id}) do
    candidate = CandidateModel.show(id)
    render(conn, "show.json", candidate: candidate)
  end

  def update(conn, %{"id" => id, "candidate" => attrs}) do
    candidate = CandidateModel.show(id)

    with {
           :ok,
           %CandidateSchema{} = candidate
         } <- CandidateModel.update(candidate, attrs) do
      render(conn, "show.json", candidate: candidate)
    end
  end

  def delete(conn, %{"id" => id}) do
    candidate = CandidateModel.show(id)

    with {
           :ok,
           %CandidateSchema{}
         } <- CandidateModel.delete(candidate) do
      send_resp(conn, :no_content, "")
    end
  end

  def create(conn, %{"candidate" => attrs}) do
    with {
           :ok,
           %CandidateSchema{} = attrs
         } <- CandidateModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", candidate: attrs)
    end
  end
end
