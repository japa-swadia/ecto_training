defmodule EctoTrainingWeb.Router do
  use EctoTrainingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  end

  scope "/", EctoTrainingWeb do
    pipe_through :api 

    get "/users", UserController, :index
    get "/user/:id", UserController, :fetch
    post "/signup", UserController, :create
    post "/update", UserController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", EctoTrainingWeb do
  #   pipe_through :api
  # end
end
