defmodule AthleteEdgeWeb.PageController do
  use AthleteEdgeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
