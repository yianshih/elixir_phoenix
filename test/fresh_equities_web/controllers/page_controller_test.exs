defmodule FreshEquitiesWeb.PageControllerTest do
  use FreshEquitiesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Live capital raises"
  end
end
