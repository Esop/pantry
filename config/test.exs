use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pantry, PantryWeb.Endpoint,
  http: [port: 4001],
  server: true

config :wallaby,
  js_errors: false,
  screenshot_on_failure: true

config :pantry, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Make tests run faster
config :comeonin, :bcrypt_log_rounds, 4

# Configure your database
config :pantry, Pantry.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pantry_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
