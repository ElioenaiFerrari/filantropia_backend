defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    resources "/candidates", CandidateController, only: [:create, :index]
    resources "/contacts", ContactController, only: [:create]
    resources "/courses", CourseController, only: [:create]
    resources "/enems", EnemController, only: [:create]
    resources "/families", FamilyController, only: [:create]
    resources "/members", MemberController, only: [:create]
    resources "/questionnaires", QuestionnaireController, only: [:create]
    resources "/vehicles", VehicleController, only: [:create]
  end
end
