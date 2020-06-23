defmodule Backend.FamilyModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.FamilySchema

  def index(FamilySchema), do: Repo.all(FamilySchema)

  def show(id), do: Repo.get!(FamilySchema, id)

  def create(attrs \\ %{}) do
    %FamilySchema{}
    |> FamilySchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%FamilySchema{} = family, attrs) do
    family
    |> FamilySchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%FamilySchema{} = family), do: Repo.delete!(family)
end
