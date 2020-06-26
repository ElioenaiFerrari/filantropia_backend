defmodule Backend.MemberModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.MemberSchema

  def index(MemberSchema), do: Repo.all(MemberSchema)

  def show(id), do: Repo.get!(MemberSchema, id)

  def create(attrs \\ %{}) do
    %MemberSchema{}
    |> MemberSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%MemberSchema{} = member, attrs) do
    member
    |> MemberSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%MemberSchema{} = member), do: Repo.delete!(member)
end
