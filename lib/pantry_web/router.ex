defmodule PantryWeb.Router do
  use PantryWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(PantryWeb.Auth, repo: Pantry.Repo)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PantryWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    resources("/clients", ClientController) do
      resources("/household", HouseholdController)
      resources("/certifications", CertificationController)
      resources("/assistance", AssistanceController)
      resources("/produce_distributions", ProduceDistributionController)
    end

    resources("/volunteers", VolunteerController)
    resources("/sessions", SessionController, only: [:new, :create, :delete])
  end

  # Other scopes may use custom stacks.
  # scope "/api", PantryWeb do
  #   pipe_through :api
  # end
end
