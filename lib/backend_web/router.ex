defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    resources "/candidates", CandidateController, only: [:create]
    resources "/contacts", ContactController, only: [:create, :index]
    resources "/courses", CoursesController, only: [:create]
    resources "/enems", EnemController, only: [:create]
    resources "/families", FamilyController, only: [:create]
    resources "/members", MemberController, only: [:create]
    resources "/questionnaires", QuestionnaireController, only: [:create]
    resources "/vehicles", VehicleController, only: [:create]
  end
end
