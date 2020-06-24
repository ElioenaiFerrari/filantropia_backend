defmodule Backend.EnemSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.QuestionnaireSchema

  schema "enems" do
    field :year, :string
    field :mean, :integer
    belongs_to :questionnaire, QuestionnaireSchema, foreign_key: :questionnaire_id

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(enem, attrs) do
    enem
    |> cast(attrs, [:year, :mean])
    |> validate_required([:year, :mean])
  end
end
