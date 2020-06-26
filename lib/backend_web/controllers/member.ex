defmodule BackendWeb.MemberController do
  use BackendWeb, :controller

  alias Backend.MemberSchema
  alias Backend.MemberModel

  def index(conn, _params) do
    members = MemberModel.index(MemberSchema)
    render(conn, "index.json", members: members)
  end

  def show(conn, %{"id" => id}) do
    member = MemberModel.show(id)
    render(conn, "show.json", member: member)
  end

  def update(conn, %{"id" => id, "member" => attrs}) do
    member = MemberModel.show(id)

    with {
           :ok,
           %MemberSchema{} = member
         } <- MemberModel.update(member, attrs) do
      render(conn, "show.json", member: member)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = MemberModel.show(id)

    with {
           :ok,
           %MemberSchema{}
         } <- MemberModel.delete(member) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"member" => attrs}) do
    with {
           :ok,
           %MemberSchema{} = attrs
         } <- MemberModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", member: attrs)
    end
  end
end
