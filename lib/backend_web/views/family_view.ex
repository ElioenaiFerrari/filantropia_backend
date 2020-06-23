defmodule BackendWeb.FamilyView do
  use BackendWeb, :view

  alias BackendWeb.FamilyView

  def render("index.json", %{families: families}) do
    %{
      data: render_many(families, FamilyView, "family.json")
    }
  end

  def render("show.json", %{family: family}) do
    %{
      data: render_one(family, FamilyView, "family.json")
    }
  end

  def render("family.json", %{family: family}) do
    %{
      id: family.id,
      housing_type: family.housing_type
    }
  end
end
