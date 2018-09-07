# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :shopify, [
  client_id: "31cf34de34a626d4a6a3bcced6c65d87",
  client_secret: "c3cf8d791ae3a8cb78ac6de04590901d"
]

# General application configuration
config :shop,
  ecto_repos: [Shop.Repo]

# Configures the endpoint
config :shop, ShopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p8SdNjaSwMMgpLfMJ8vl3klv5PEa9mMd+ZvmM8f88F5z5MELAKEfqENag+ofbO3Z",
  render_errors: [view: ShopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Shop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
