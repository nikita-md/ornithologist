defmodule OrnithologistWeb.TaskControllerTest do
  use OrnithologistWeb.ConnCase

  test "POST /tasks", %{conn: conn} do
    conn = post(conn, "/tasks", task: %{ name: "test", description: "test", priority: 0 })
    assert html_response(conn, 302)
  end

  test "GET /tasks", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200)
  end
end
