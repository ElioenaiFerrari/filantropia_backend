defmodule Backend.ContactModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.ContactSchema

  def index(ContactSchema), do: Repo.all(ContactSchema)

  def show(id), do: Repo.get!(ContactSchema, id)

  def create(attrs \\ %{}) do
    %ContactSchema{}
    |> ContactSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%ContactSchema{} = contact, attrs) do
    contact
    |> ContactSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%ContactSchema{} = contact), do: Repo.delete!(contact)
end
