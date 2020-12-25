defmodule FreshEquities.Repo do
  use Ecto.Repo,
    otp_app: :fresh_equities,
    adapter: Ecto.Adapters.Postgres
end
