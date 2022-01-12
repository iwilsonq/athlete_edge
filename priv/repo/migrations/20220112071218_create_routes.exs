defmodule AthleteEdge.Repo.Migrations.CreateRoutes do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :name, :string

      timestamps()
    end

    execute("SELECT AddGeometryColumn ('routes','path',4326,'LINESTRING',2);")
  end
end
