# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ecto_training,
  ecto_repos: [EctoTraining.Repo]

# Configures the endpoint
config :ecto_training, EctoTrainingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k9V6zLeLJb5jbAilAVnu0D1c92JfHLh/JhZ66KReCpgjkl1lMweaiLSj6K+ePuUv",
  render_errors: [view: EctoTrainingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EctoTraining.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
