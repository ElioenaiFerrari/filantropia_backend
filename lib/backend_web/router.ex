defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    resources "/candidates", CandidateController, except: [:new, :edit]
    resources "/contacts", ContactController, except: [:new, :edit]
    resources "/courses", CoursesController, except: [:new, :edit]
    resources "/enems", EnemController, except: [:new, :edit]
    resources "/families", FamilyController, except: [:new, :edit]
    resources "/members", MemberController, except: [:new, :edit]
    resources "/questionnaires", QuestionnaireController, except: [:new, :edit]
    resources "/vehicles", VehicleController, except: [:new, :edit]
  end
end
