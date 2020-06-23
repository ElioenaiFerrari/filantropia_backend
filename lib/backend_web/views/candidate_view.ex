defmodule BackendWeb.CandidateView do
  use BackendWeb, :view
  alias BackendWeb.CandidateView

  def render("index.json", %{candidates: candidates}) do
    %{
      data: render_many(candidates, CandidateView, "candidate.json")
    }
  end

  def render("show.json", %{candidate: candidate}) do
    %{
      data: render_one(candidate, CandidateView, "candidate.json")
    }
  end

  def render("candidate.json", %{candidate: candidate}) do
    %{
      id: candidate.id,
      name: candidate.name,
      sex: candidate.sex,
      birthday: candidate.birthday
    }
  end
end
