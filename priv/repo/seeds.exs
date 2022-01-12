# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AthleteEdge.Repo.insert!(%AthleteEdge.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

AthleteEdge.Repo.insert!(%AthleteEdge.Log.Workout{
  title: "An morning run",
  duration: 1000 * 60 * 25,
  kind: "outdoor_run",
  notes: "my foot was kind of sore after"
})
AthleteEdge.Repo.insert!(%AthleteEdge.Log.Workout{
  title: "An afternoon run",
  duration: 1000 * 60 * 35,
  kind: "outdoor_run",
  notes: "felt pretty good out there!"
})
AthleteEdge.Repo.insert!(%AthleteEdge.Log.Workout{
  title: "An evening run",
  duration: 1000 * 60 * 30,
  kind: "indoor_run",
  notes: "not sure what exactly to put here"
})
