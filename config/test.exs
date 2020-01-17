use Mix.Config

# Configure your database
config :query_test, QueryTest.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "jackjoe",
  password: "",
  database: "query_test_dev",
  hostname: "localhost",
  pool_size: 20,
  prepare: :unnamed

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :query_test, QueryTestWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
