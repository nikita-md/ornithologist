defmodule OrnithologistWeb.TaskController do
  use OrnithologistWeb, :controller

  alias Ornithologist.{Repo, Task}

  def new(conn, _params) do
    render(conn, "new.html", changeset: Task.changeset(%Task{}))
  end

  def create(conn, %{"task" => task} = params) do
    case Repo.insert(Task.changeset(%Task{}, task)) do
      {:ok, task} -> conn
        |> put_flash(:info, "task successfully created")
        |> redirect(to: Routes.home_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
