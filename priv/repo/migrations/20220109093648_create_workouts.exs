defmodule AthleteEdge.Repo.Migrations.CreateWorkouts do
  use Ecto.Migration

  def change do
    create table(:workouts) do
      add :title, :string
      add :duration, :integer
      add :kind, :string
      add :notes, :string

      timestamps()
    end
  end
end
