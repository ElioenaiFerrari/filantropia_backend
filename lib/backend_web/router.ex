defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    get "/candidates", CandidateController, :index
    get "/candidates/:id", CandidateController, :show
  end
end
