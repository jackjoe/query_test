defmodule QueryTestWeb.PageControllerTest do
  use QueryTestWeb.ConnCase

  @tag timeout: :infinity
  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
