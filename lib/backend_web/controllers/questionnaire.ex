defmodule BackendWeb.QuestionnaireController do
  use BackendWeb, :controller

  alias Backend.QuestionnaireSchema
  alias Backend.QuestionnaireModel

  def index(conn, _params) do
    questionnaires = QuestionnaireModel.index(QuestionnaireSchema)
    render(conn, "index.json", questionnaires: questionnaires)
  end

  def show(conn, %{"id" => id}) do
    questionnaire = QuestionnaireModel.show(id)
    render(conn, "show.json", questionnaire: questionnaire)
  end

  def update(conn, %{"id" => id, "questionnaire" => attrs}) do
    questionnaire = QuestionnaireModel.show(id)

    with {
           :ok,
           %QuestionnaireSchema{} = questionnaire
         } <- QuestionnaireModel.update(questionnaire, attrs) do
      render(conn, "show.json", questionnaire: questionnaire)
    end
  end

  def delete(conn, %{"id" => id}) do
    questionnaire = QuestionnaireModel.show(id)

    with {
           :ok,
           %QuestionnaireSchema{}
         } <- QuestionnaireModel.delete(questionnaire) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"questionnaire" => attrs}) do
    with {
           :ok,
           %QuestionnaireSchema{} = attrs
         } <- QuestionnaireModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", questionnaire: attrs)
    end
  end
end
