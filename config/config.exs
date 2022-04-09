# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat,
  ecto_repos: [Chat.Repo]

# Configures the endpoint
config :chat, ChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XUK1c9zHtz0ox6aH/P2/6q6FcJR+bMbQk03oDKroP/zsJhcIygP7MB/UZLrb5nzC",
  render_errors: [view: ChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chat.PubSub,
  live_view: [signing_salt: "6w9EPTVl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure the default time zone database
# config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase
# config :nano_planner, NanoPlanner.Repo, migration_timestamps: [type: :timestamptz]

# Configures the default time zone
config :chat, default_time_zone: "Asia/Tokyo"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
