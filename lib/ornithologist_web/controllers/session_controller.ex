defmodule OrnithologistWeb.SessionController do
  use OrnithologistWeb, :controller

  alias Ornithologist.Auth

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{ "email" => email, "password" => password }) do
    case Auth.sign_in(email, password) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Hello")
        |> redirect(to: Routes.task_path(conn, :index))
      {:error, message} ->
        conn
        |> put_flash(:error, "Email or password doesn't match")
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "You signed out")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
