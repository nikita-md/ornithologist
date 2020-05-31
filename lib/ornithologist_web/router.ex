defmodule OrnithologistWeb.Router do
  use OrnithologistWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :exq do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug ExqUi.RouterPlug, namespace: "exq"
  end

  scope "/exq", ExqUi do
    pipe_through :exq
    forward "/", RouterPlug.Router, :index
  end

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  scope "/", OrnithologistWeb do
    pipe_through :browser

    get "/", TaskController, :index

    delete "/tasks/delete_all", TaskController, :delete_all
    resources "tasks", TaskController
  end

  # Other scopes may use custom stacks.
  # scope "/api", OrnithologistWeb do
  #   pipe_through :api
  # end
end
