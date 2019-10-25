# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :takso,
  ecto_repos: [Takso.Repo]

# Configures the endpoint
config :takso, TaksoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ru9pmjlGkyWUlCLRtdd4B9IE3R22x2YJOzGWH/T6Vr6zIvJ2Bkqud9KjgO5Ya4ub",
  render_errors: [view: TaksoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Takso.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :takso, Takso.Guardian,
  issuer: "takso",
  secret_key: "wP9aV1iwQAgAn+gBW7COuNDFpwe4AEH+HZF5pUWCBDgEcdVuqOnCFH0TdC1h4zdO" # put the result of running `mix guardian.gen.secret`

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
