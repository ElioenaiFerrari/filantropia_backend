defmodule BackendWeb.MemberView do
  use BackendWeb, :view
  alias BackendWeb.MemberView

  def render("index.json", %{members: members}) do
    %{
      data: render_many(members, MemberView, "member.json")
    }
  end

  def render("show.json", %{member: member}) do
    %{
      data: render_one(member, MemberView, "member.json")
    }
  end

  def render("member.json", %{member: member}) do
    %{
      id: member.id,
      name: member.name,
      age: member.age,
      relationship: member.relationship,
      civil_status: member.civil_status,
      scholarity: member.scholarity,
      profession: member.profession,
      income: member.income
    }
  end
end
