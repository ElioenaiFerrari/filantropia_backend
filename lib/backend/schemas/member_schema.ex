defmodule Backend.MemberSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.FamilySchema

  schema "members" do
    field :name, :string
    field :age, :string
    field :relationship, :string
    field :civil_status, :string
    field :scholarity, :string
    field :profession, :string
    field :income, :integer
    belongs_to :family, FamilySchema

    timestamps(type: :utc_datetime)
  end

  def changeset(member, attrs) do
    member
    |> cast(attrs, [
      :name,
      :age,
      :relationship,
      :civil_status,
      :scholarity,
      :profession,
      :income
    ])
    |> validate_required([
      :name,
      :age,
      :relationship,
      :civil_status,
      :scholarity,
      :profession,
      :income
    ])
  end
end
