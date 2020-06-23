defmodule Backend.CourseSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.CandidateSchema

  schema "courses" do
    field :course, :string
    belongs_to :candidate, CandidateSchema, foreign_key: :candidate_schema_id

    timestamps(type: :utc_datetime)
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:courses])
    |> validate_required([:courses])
  end
end