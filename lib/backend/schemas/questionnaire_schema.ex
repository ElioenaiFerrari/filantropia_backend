defmodule Backend.QuestionnaireSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.EnemSchema

  schema "questionnaires" do
    field :training, :string
    field :is_teacher, :boolean
    field :is_linked, :boolean
    has_one :enem, EnemSchema

    timestamps(type: :utc_datetime)
  end

  def changeset(questionnaire, attrs) do
    questionnaire
    |> cast(attrs, [
      :training,
      :is_teacher,
      :is_linked
    ])
    |> validate_required([
      :training,
      :is_teacher,
      :is_linked
    ])
  end
end
