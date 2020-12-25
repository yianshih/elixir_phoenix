# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fresh_equities,
  ecto_repos: [FreshEquities.Repo]

# Configures the endpoint
config :fresh_equities, FreshEquitiesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jMagF1z+xgpbhbuTRlvjA2V/3m54psmCn5f05zDYwxSrhtlV84fG1XMMJtH8j5Ai",
  render_errors: [view: FreshEquitiesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FreshEquities.PubSub,
  live_view: [signing_salt: "x/4241h/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
