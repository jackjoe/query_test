defmodule QueryTestWeb.PageController do
  use QueryTestWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def create(conn, _) do
    QueryTest.massive_run()
    render(conn, :done)
  end
end
