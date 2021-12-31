defmodule AthleteEdge.LogTest do
  use AthleteEdge.DataCase

  alias AthleteEdge.Log

  describe "workouts" do
    alias AthleteEdge.Log.Workout

    import AthleteEdge.LogFixtures

    @invalid_attrs %{duration: nil, kind: nil, notes: nil, title: nil}

    test "list_workouts/0 returns all workouts" do
      workout = workout_fixture()
      assert Log.list_workouts() == [workout]
    end

    test "get_workout!/1 returns the workout with given id" do
      workout = workout_fixture()
      assert Log.get_workout!(workout.id) == workout
    end

    test "create_workout/1 with valid data creates a workout" do
      valid_attrs = %{duration: 42, kind: "some kind", notes: "some notes", title: "some title"}

      assert {:ok, %Workout{} = workout} = Log.create_workout(valid_attrs)
      assert workout.duration == 42
      assert workout.kind == "some kind"
      assert workout.notes == "some notes"
      assert workout.title == "some title"
    end

    test "create_workout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Log.create_workout(@invalid_attrs)
    end

    test "update_workout/2 with valid data updates the workout" do
      workout = workout_fixture()
      update_attrs = %{duration: 43, kind: "some updated kind", notes: "some updated notes", title: "some updated title"}

      assert {:ok, %Workout{} = workout} = Log.update_workout(workout, update_attrs)
      assert workout.duration == 43
      assert workout.kind == "some updated kind"
      assert workout.notes == "some updated notes"
      assert workout.title == "some updated title"
    end

    test "update_workout/2 with invalid data returns error changeset" do
      workout = workout_fixture()
      assert {:error, %Ecto.Changeset{}} = Log.update_workout(workout, @invalid_attrs)
      assert workout == Log.get_workout!(workout.id)
    end

    test "delete_workout/1 deletes the workout" do
      workout = workout_fixture()
      assert {:ok, %Workout{}} = Log.delete_workout(workout)
      assert_raise Ecto.NoResultsError, fn -> Log.get_workout!(workout.id) end
    end

    test "change_workout/1 returns a workout changeset" do
      workout = workout_fixture()
      assert %Ecto.Changeset{} = Log.change_workout(workout)
    end
  end
end
