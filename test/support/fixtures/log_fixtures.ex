defmodule AthleteEdge.LogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AthleteEdge.Log` context.
  """

  @doc """
  Generate a workout.
  """
  def workout_fixture(attrs \\ %{}) do
    {:ok, workout} =
      attrs
      |> Enum.into(%{
        duration: 42,
        kind: "some kind",
        notes: "some notes",
        title: "some title"
      })
      |> AthleteEdge.Log.create_workout()

    workout
  end
end
