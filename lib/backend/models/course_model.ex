defmodule Backend.CourseModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.CourseSchema

  def index(CourseSchema), do: Repo.all(CourseSchema)

  def show(id), do: Repo.get!(CourseSchema, id)

  def create(attrs \\ %{}) do
    %CourseSchema{}
    |> CourseSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%CourseSchema{} = course, attrs) do
    course
    |> CourseSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%CourseSchema{} = course), do: Repo.delete!(course)
end
