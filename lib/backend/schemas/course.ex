defmodule Backend.CourseSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.CandidateSchema

  schema "courses" do
    field :course, :string
    belongs_to :candidate, CandidateSchema

    timestamps(type: :utc_datetime)
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:course, :candidate_id])
    |> validate_required([:course, :candidate_id])
  end
end
