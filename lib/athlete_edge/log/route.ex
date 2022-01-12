defmodule AthleteEdge.Log.Route do
  use Ecto.Schema
  import Ecto.Changeset

  schema "routes" do
    field :name, :string
    field :path, Geo.PostGIS.Geometry

    belongs_to(:workout, AthleteEdge.Log.Route, foreign_key: :workout_id)

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:name, :path])
    |> validate_required([:name, :path])
  end
end
