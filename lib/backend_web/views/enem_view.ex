defmodule BackendWeb.EnemView do
  use BackendWeb, :view

  alias BackendWeb.EnemView

  def render("index.json", %{enems: enems}) do
    %{
      data: render_many(enems, EnemView, "enem.json")
    }
  end

  def render("show.json", %{enem: enem}) do
    %{
      data: render_one(enem, EnemView, "enem.json")
    }
  end

  def render("enem.json", %{enem: enem}) do
    %{
      id: enem.id,
      year: enem.year,
      mean: enem.mean
    }
  end
end
