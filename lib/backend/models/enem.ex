defmodule Backend.EnemModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.EnemSchema

  def index(EnemSchema), do: Repo.all(EnemSchema)

  def show(id), do: Repo.get!(EnemSchemam, id)

  def create(attrs \\ %{}) do
    %EnemSchema{}
    |> EnemSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%EnemSchema{} = enem, attrs) do
    enem
    |> EnemSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%EnemSchema{} = enem), do: Repo.delete!(enem)
end
