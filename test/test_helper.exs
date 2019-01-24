ExUnit.start()

{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, PantryWeb.Endpoint.url())
Application.put_env(:wallaby, :screenshot_on_failure, true)

Ecto.Adapters.SQL.Sandbox.mode(Pantry.Repo, :manual)
