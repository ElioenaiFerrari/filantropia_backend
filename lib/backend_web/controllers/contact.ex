defmodule BackendWeb.ContactController do
  use BackendWeb, :controller

  alias Backend.ContactModel
  alias Backend.CandidateModel
  alias Backend.ContactSchema
  alias Backend.Repo

  def index(conn, _params) do
    contacts = ContactModel.index(ContactSchema)
    render(conn, "index.json", contacts: contacts)
  end

  def show(conn, %{"id" => id}) do
    contact = ContactModel.show(id)
    render(conn, "show.json", contact: contact)
  end

  def update(conn, %{"id" => id, "contact" => attrs}) do
    contact = ContactModel.show(id)

    with {
           :ok,
           %ContactSchema{} = contact
         } <- ContactModel.update(contact, attrs) do
      render(conn, "show.json", contact: contact)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = ContactModel.show(id)

    with {
           :ok,
           %ContactSchema{}
         } <- ContactModel.delete(contact) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"contact" => contact}) do
    with {
           :ok,
           contact
         } <- ContactModel.create(contact) do
      conn
      |> put_status(:created)
      |> render("show.json", contact: contact)
    end
  end
end
