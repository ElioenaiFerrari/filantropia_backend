defmodule Backend.CandidateSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.ContactSchema
  alias Backend.CourseSchema
  alias Backend.QuestionnaireSchema
  alias Backend.FamilySchema

  schema "candidates" do
    field :name, :string
    field :sex, :string
    field :birthday, :string
    has_one :contact, ContactSchema
    has_many :courses, CourseSchema
    has_one :questionnaire, QuestionnaireSchema
    has_one :family, FamilySchema

    timestamps(type: :utc_datetime)
  end

  def changeset(candidate, attrs) do
    candidate
    |> cast(attrs, [:name, :sex, :birthday])
    |> validate_required([:name, :sex, :birthday])
    |> validate_inclusion(:sex, ["Masculino", "Feminino", "Outros"])
  end
end
