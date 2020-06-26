defmodule Backend.QuestionnaireSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.EnemSchema
  alias Backend.CandidateSchema

  schema "questionnaires" do
    field :training, :string
    field :is_teacher, :boolean
    field :is_linked, :boolean
    has_one :enem, EnemSchema
    belongs_to :candidate, CandidateSchema

    timestamps(type: :utc_datetime)
  end

  def changeset(questionnaire, attrs) do
    questionnaire
    |> cast(attrs, [
      :training,
      :is_teacher,
      :is_linked,
      :candidate_id
    ])
    |> cast_assoc(:enem)
    |> validate_required([
      :training,
      :is_teacher,
      :is_linked,
      :candidate_id
    ])
  end
end
