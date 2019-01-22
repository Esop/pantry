ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Pantry.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:pantry, :base_url, PantryWeb.Endpoint.url())
