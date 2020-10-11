# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ornithologist,
  ecto_repos: [Ornithologist.Repo]

# Configures the endpoint
config :ornithologist, OrnithologistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY"),
  render_errors: [view: OrnithologistWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Ornithologist.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :exq,
  name: Exq,
  host: System.get_env("REDIS_HOST"),
  port: System.get_env("REDIS_PORT"),
  namespace: "exq",
  concurrency: 500,
  queues: ["default"]
  # poll_timeout: 50,
  # scheduler_poll_timeout: 200,
  # scheduler_enable: true,
  # max_retries: 25,
  # mode: :default,
  # shutdown_timeout: 5000

config :exq_ui,
  server: true

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
