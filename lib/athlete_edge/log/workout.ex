defmodule AthleteEdge.Log.Workout do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workouts" do
    field :duration, :integer
    field :kind, :string
    field :notes, :string
    field :title, :string

    has_one :route, AthleteEdge.Log.Route

    timestamps()
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:title, :duration, :kind, :notes, :route])
    |> validate_required([:title, :duration, :kind, :notes])
  end
end
