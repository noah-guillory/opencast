import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :opencast, Opencast.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "opencast_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :opencast, OpencastWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "TXM8S0r4O0wIE1tIAizrPgJ2Z0pwH/89egdQWU7jW75OUEzj/jbz5qfwAvFRC+4I",
  server: false

# In test we don't send emails.
config :opencast, Opencast.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
