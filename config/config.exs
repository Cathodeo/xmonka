import Config

config :xmonka, Xmonka.Repo,
  database: "cards",
  username: "xmonka",
  password: "xmonka",
  hostname: "localhost"

  config :xmonka, ecto_repos: [Xmonka.Repo]