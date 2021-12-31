defmodule AthleteEdge.Repo do
  use Ecto.Repo,
    otp_app: :athlete_edge,
    adapter: Ecto.Adapters.Postgres
end
