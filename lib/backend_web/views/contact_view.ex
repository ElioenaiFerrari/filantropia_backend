defmodule BackendWeb.ContactView do
  use BackendWeb, :view
  alias BackendWeb.ContactView

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{
      id: contact.id,
      cellphone: contact.cellphone,
      phone: contact.phone,
      email: contact.email,
      address: contact.address,
      district: contact.district,
      number: contact.number,
      adjunct: contact.adjunct,
      zip_code: contact.zip_code,
      state: contact.state
      # person: BackendWeb.PersonView.render("show.json", %{person: contact.person})
    }
  end
end
