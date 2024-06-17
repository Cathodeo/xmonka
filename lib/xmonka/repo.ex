defmodule Xmonka.Repo do
  use Ecto.Repo,
    otp_app: :xmonka,
    adapter: Ecto.Adapters.Postgres
end
