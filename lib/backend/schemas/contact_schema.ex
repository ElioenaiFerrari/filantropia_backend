defmodule Backend.ContactSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.CandidateSchema

  schema "contacts" do
    field :cellphone, :string
    field :phone, :string
    field :email, :string
    field :address, :string
    field :district, :string
    field :number, :string
    field :adjunct, :string
    field :zip_code, :string
    field :state, :string
    belongs_to :candidate, CandidateSchema

    timestamps(type: :utc_datetime)
  end

  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [
      :cellphone,
      :phone,
      :email,
      :address,
      :district,
      :number,
      :adjunct,
      :zip_code
    ])
    |> validate_required([
      :cellphone,
      :email,
      :address,
      :district,
      :number,
      :zip_code,
      :state
    ])
  end
end
