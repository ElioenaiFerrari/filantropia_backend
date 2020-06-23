defmodule Backend.EnemSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.QuestionnaireSchema

  schema "enems" do
    field :year, :string
    field :mean, :integer
    belongs_to :questionnaire, QuestionnaireSchema, foreign_key: :questionnaire_schema_id

    timestamps(type: :utc_datetime)
  end

  def changeset(enem, attrs) do
    enem
    |> cast(attrs, [:year, :mean])
    |> validate_required([:year, :mean])
  end
end
