defmodule AthleteEdgeWeb.WorkoutControllerTest do
  use AthleteEdgeWeb.ConnCase

  import AthleteEdge.LogFixtures

  alias AthleteEdge.Log.Workout

  @create_attrs %{
    duration: 42,
    kind: "some kind",
    notes: "some notes",
    title: "some title"
  }
  @update_attrs %{
    duration: 43,
    kind: "some updated kind",
    notes: "some updated notes",
    title: "some updated title"
  }
  @invalid_attrs %{duration: nil, kind: nil, notes: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all workouts", %{conn: conn} do
      conn = get(conn, Routes.workout_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create workout" do
    test "renders workout when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workout_path(conn, :create), workout: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.workout_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "duration" => 42,
               "kind" => "some kind",
               "notes" => "some notes",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workout_path(conn, :create), workout: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update workout" do
    setup [:create_workout]

    test "renders workout when data is valid", %{conn: conn, workout: %Workout{id: id} = workout} do
      conn = put(conn, Routes.workout_path(conn, :update, workout), workout: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.workout_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "duration" => 43,
               "kind" => "some updated kind",
               "notes" => "some updated notes",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, workout: workout} do
      conn = put(conn, Routes.workout_path(conn, :update, workout), workout: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete workout" do
    setup [:create_workout]

    test "deletes chosen workout", %{conn: conn, workout: workout} do
      conn = delete(conn, Routes.workout_path(conn, :delete, workout))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.workout_path(conn, :show, workout))
      end
    end
  end

  defp create_workout(_) do
    workout = workout_fixture()
    %{workout: workout}
  end
end
