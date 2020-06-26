defmodule Backend.CandidateModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.CandidateSchema

  def index(CandidateSchema) do
    Repo.all(CandidateSchema)
  end

  def show(id), do: Repo.get!(CandidateSchema, id)

  def create(attrs \\ %{}) do
    %CandidateSchema{}
    |> CandidateSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%CandidateSchema{} = candidate, attrs) do
    candidate
    |> CandidateSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%CandidateSchema{} = candidate), do: Repo.delete!(candidate)
end
