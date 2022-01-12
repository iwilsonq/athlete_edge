defmodule AthleteEdge.Repo.Migrations.AddRoutesWorkoutsRelation do
  use Ecto.Migration

  def change do
    alter table(:routes) do
      add(:workout_id, references(:workouts))
    end
  end
end
