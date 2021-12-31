defmodule AthleteEdgeWeb.WorkoutController do
  use AthleteEdgeWeb, :controller

  alias AthleteEdge.Log
  alias AthleteEdge.Log.Workout

  action_fallback AthleteEdgeWeb.FallbackController

  def index(conn, _params) do
    workouts = Log.list_workouts()
    render(conn, "index.json", workouts: workouts)
  end

  def create(conn, %{"workout" => workout_params}) do
    with {:ok, %Workout{} = workout} <- Log.create_workout(workout_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workout_path(conn, :show, workout))
      |> render("show.json", workout: workout)
    end
  end

  def show(conn, %{"id" => id}) do
    workout = Log.get_workout!(id)
    render(conn, "show.json", workout: workout)
  end

  def update(conn, %{"id" => id, "workout" => workout_params}) do
    workout = Log.get_workout!(id)

    with {:ok, %Workout{} = workout} <- Log.update_workout(workout, workout_params) do
      render(conn, "show.json", workout: workout)
    end
  end

  def delete(conn, %{"id" => id}) do
    workout = Log.get_workout!(id)

    with {:ok, %Workout{}} <- Log.delete_workout(workout) do
      send_resp(conn, :no_content, "")
    end
  end
end
