defmodule Backend.QuestionnaireModel do
  import Ecto.Query, warn: false

  alias Backend.Repo
  alias Backend.QuestionnaireSchema

  def index(QuestionnaireSchema), do: Repo.all(QuestionnaireSchema)

  def show(id), do: Repo.get!(QuestionnaireSchema, id)

  def create(attrs \\ %{}) do
    %QuestionnaireSchema{}
    |> QuestionnaireSchema.changeset(attrs)
    |> Repo.insert()
  end

  def update(%QuestionnaireSchema{} = questionnaire, attrs) do
    questionnaire
    |> QuestionnaireSchema.changeset(attrs)
    |> Repo.update()
  end

  def delete(%QuestionnaireSchema{} = questionnaire), do: Repo.delete!(questionnaire)
end
