defmodule Backend.FamilySchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.VehicleSchema
  alias Backend.MemberSchema
  alias Backend.CandidateSchema

  schema "families" do
    field :housing_type, :string
    has_many :vehicles, VehicleSchema, foreign_key: :family_id
    has_many :members, MemberSchema, foreign_key: :family_id
    belongs_to :candidate, CandidateSchema
    timestamps(type: :utc_datetime)
  end

  def changeset(family, attrs) do
    family
    |> cast(attrs, [:housing_type])
    |> cast_assoc(:vehicles)
    |> validate_required([:housing_type])
  end
end
