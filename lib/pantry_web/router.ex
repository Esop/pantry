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

  pipeline :authentication do
    plug(PantryWeb.CheckAuth)
  end

  scope "/", PantryWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    get("/login", SessionController, :new)
    post("/login", SessionController, :create)
    get("/logout", SessionController, :delete)


  end
    if Mix.env() == :dev do
      forward("/sent_emails", Bamboo.SentEmailViewerPlug)
    end

  scope "/", PantryWeb do
    pipe_through([:browser, :authentication])

    resources("/volunteers", VolunteerController)

    resources("/clients", ClientController) do
      resources("/household", HouseholdController)
      resources("/certifications", CertificationController)
      resources("/assistance", AssistanceController)
      resources("/produce_distributions", ProduceDistributionController)
    end
  end
end
