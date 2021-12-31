defmodule AthleteEdgeWeb.WorkoutView do
  use AthleteEdgeWeb, :view
  alias AthleteEdgeWeb.WorkoutView

  def render("index.json", %{workouts: workouts}) do
    %{data: render_many(workouts, WorkoutView, "workout.json")}
  end

  def render("show.json", %{workout: workout}) do
    %{data: render_one(workout, WorkoutView, "workout.json")}
  end

  def render("workout.json", %{workout: workout}) do
    %{
      id: workout.id,
      title: workout.title,
      duration: workout.duration,
      kind: workout.kind,
      notes: workout.notes
    }
  end
end
