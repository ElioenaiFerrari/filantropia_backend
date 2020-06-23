defmodule BackendWeb.QuestionnaireView do
  use BackendWeb, :view
  alias BackendWeb.QuestionnaireView

  def render("index.json", %{questionnaires: questionnaires}) do
    %{
      data: render_many(questionnaires, QuestionnaireView, "questionnaire.json")
    }
  end

  def render("show.json", %{questionnaire: questionnaire}) do
    %{
      data: render_one(questionnaire, QuestionnaireView, "questionnaire.json")
    }
  end

  def render("questionnaire.json", %{questionnaire: questionnaire}) do
    %{
      id: questionnaire.id,
      training: questionnaire.training,
      is_teacher: questionnaire.is_teacher,
      is_linked: questionnaire.is_linked
    }
  end
end
